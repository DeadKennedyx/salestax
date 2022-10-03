require 'yaml'

class Input
  def carts
    (YAML::parse(File.open('./inputs.yml'))).transform
  end

  def tax_rates
    (YAML::parse(File.open('./tax_rates.yml'))).transform
  end
end
