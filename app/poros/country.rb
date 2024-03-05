class Country

  attr_reader :name, :capital, :independent, :status, :coords

  def initialize(attrs)
    @name = attrs[:name][:common]
    @capital = attrs[:capital]
    @independent = attrs[:independent]
    @status = attrs[:status]
    @coords = attrs[:capitalInfo][:latlng]
  end
end
