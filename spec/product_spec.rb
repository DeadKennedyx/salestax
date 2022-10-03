require 'product.rb'
require 'tax.rb'

describe Product do

 before do
    @tax = Tax.EMPTY
    @imported_tax = Tax.new(@tax, 5)
    @basic_tax = Tax.new(@tax, 10)
    @exempt_tax = Tax.new(@tax, 0)
  end

  it "should create a new product with no tax" do
    product = Product.new("product", 10, 1, @tax)
    product.calculate_tax.should == 0
    product.price_with_tax.should == 10
  end

  it "should calculate basic tax for a product" do
    product = Product.new("product", 10, 1, @basic_tax)
    product.calculate_tax.should == 1
  end

  it "should calculate price (with tax) for an exempt product" do
    product = Product.new("product", 19.95, 1, @exempt_tax)
    product.price_with_tax.should == 19.95
  end

 it "should round up tax calculated to nearest 5 cents" do
    tax = Tax.new(@imported_tax, 10)
    product = Product.new("product", 19.25, 1, tax)
    product.calculate_tax.should == 2.90
  end

  it "should round up tax calculated to nearest 5 cents, when more than 2 tax rates are applied" do
    tax = Tax.new(@imported_tax, 7)
    tax = Tax.new(tax, 10)
    product = Product.new("product", 19.25, 1, tax)
    product.calculate_tax.should == 4.25
  end


end
