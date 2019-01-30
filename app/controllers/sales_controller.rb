class SalesController < SecureController

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # POST /sales
  # POST /sales.json
  def import_file_table
    @error = true
    scanned_data = ReadFile.scan(sale_params[:file_table], Sale.regex_read_file_table)
    if scanned_data
      begin
        sales_mapped = Sale.map_scanned_data scanned_data
        Sale.create(sales_mapped)
        @total_gross_income = Sale.calc_total_gross_income sales_mapped
        @error = false
      rescue
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:file_table)
    end
end
