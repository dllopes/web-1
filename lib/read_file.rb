class ReadFile
  @@regex_to_scan = /(.+)\t(.+)\t(.+)\t(.+)\t(.+)\t(.+)/

  def self.scan(table_file)
    table_read = read_file(table_file, @@regex_to_scan)

    read_rows_and_fill_objects(table_read)
  end

  private

  def self.read_file(file, regex_to_scan)
    file.read.force_encoding("UTF-8").scan(regex_to_scan)
  end

  def self.get_related_objects_ids
    purchaser = Purchaser.find_or_create_by name: @@purchaser.name
    item      = Item.find_or_create_by      description: @@item.description, price: @@item.price
    merchant  = Merchant.find_or_create_by  name: @@merchant.name, address: @@merchant.address
    { count: @@purchase.count, purchaser: purchaser, item: item, merchant: merchant }
  end

  def self.read_rows_and_fill_objects(table)
    titles = table.shift.map(&:downcase)

    table.each do |row|

      titles.each do |title|
        class_reference, attribute_reference = title.split(' ')
        built_object = object_by_class_reference(class_reference)
        built_object.assign_attributes "#{attribute_reference}": row.shift
      end

      Purchase.create(get_related_objects_ids)
    end

  end

  def self.object_by_class_reference(reference)
    reference = reference.downcase
    {
      "#{Purchase.to_s.downcase}": (@@purchase ||= Purchase.new),
      "#{Purchaser.to_s.downcase}": (@@purchaser ||= Purchaser.new),
      "#{Item.to_s.downcase}": (@@item ||= Item.new),
      "#{Merchant.to_s.downcase}": (@@merchant ||= Merchant.new)
    }[reference.to_sym]
  end

end