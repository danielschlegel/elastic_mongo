class JumpingMongo
  include Mongoid::Document
  include Tire::Model::Search

  belongs_to :elastic_slackline

  field :name, type: String
  field :url, type: String

  attr_accessible :name, :url, :elastic_slackline

  after_save :index

  tire do
    mapping :analyzer => 'snowball' do
      indexes :name, :type => 'string'
    end
  end

  def to_indexed_json
    {
        :id => id,
        :name => name,
        :slackline => elastic_slackline ? elastic_slackline.name : ""
    }.to_json
  end

  def index
    update_index
  end


end
