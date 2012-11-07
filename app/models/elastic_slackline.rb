class ElasticSlackline
  include Mongoid::Document

  field :name, type: String
  field :weight, type: Integer
  field :elasticity, type: Float

  attr_accessible :name, :weight, :elasticity

  has_many :jumping_mongos

end
