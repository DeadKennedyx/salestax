class Receipt
  def initialize
    @line_items = []
    @sales_tax_total = 0
    @receipt_total = 0
  end

  def add_line_item(product)
    @line_items << product
    @sales_tax_total += product.calculate_tax
    @receipt_total += product.price_with_tax
  end

  def list_line_items
    line_item_data = @line_items.collect do  |line_item|
       line_item.quantity.to_s + " " + line_item.format_description + ": " + line_item.price_with_tax.to_s
    end
    line_item_data.join("\n")
  end

  def list_tax_total
    return "Sales Taxes: " +  ("%.2f" %(@sales_tax_total.to_f))
  end

  def list_receipt_total
    return "Total: " + ("%.2f" %(@receipt_total.to_f))
  end
end
