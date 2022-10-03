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
end
