require './lib/inputs.rb'
require './lib/product.rb'
require './lib/tax.rb'
require './lib/receipt.rb'

inputs = Input.new
carts = inputs.carts
tax_rates = inputs.tax_rates

carts.each do |cart|
  receipt = Receipt.new
  cart.each do |product|
    tax = Tax.EMPTY
    product["tax categories"].each do |tax_category|
      tax = Tax.new(tax, tax_rates[tax_category])
    end
    receipt.add_line_item(Product.new(product["product"], product["price"], product["quantity"], tax))
  end
  puts receipt.list_line_items
  puts receipt.list_tax_total
  puts receipt.list_receipt_total
  puts "\n \n"
end
