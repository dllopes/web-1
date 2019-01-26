class ReadFile
  def self.scan(table_file, regex)
    begin
      read_file(table_file).scan(regex)
    rescue
      false
    end
  end

  private

  def self.read_file(file)
    file.read.force_encoding("UTF-8")
  end

end