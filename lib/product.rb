class Product
  ROUNDING_TO = 0.05

  def initialize(description, price, quantity, tax)
    @description = description
    @quantity = quantity
    @price = price
    @tax = tax
    @total_price = price * quantity
  end

  def format_description
    @description
  end

  def price_with_tax
   return ("%.2f" %(@total_price + calculate_tax)).to_f
  end

  def calculate_tax
   raw_tax = @tax.calculate_tax(@total_price)
   ("%.2f" %(((raw_tax/ROUNDING_TO).ceil) * ROUNDING_TO)).to_f
  end

  attr_reader :quantity
end
