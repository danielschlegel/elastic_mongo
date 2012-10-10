require 'set'
require 'benchmark'

class Search

  attr_accessor :query, :highlighting, :results, :page, :per_page

  def initialize
    #super
    @page ||= 1
    @per_page ||= 50
  end

  def execute
    @search = Tire::Search::Search.new(User.tire.index.name, :page => page, :per_page => per_page, :load => true)
    @search.query do |q|
      q.boolean :minimum_number_should_match => 1 do |b|
        b.should do |s|
          s.string query, :default_operator => "OR", :analyzer => "whitespace"
        end
      end
    end
    @search.explain true
    Rails.logger.debug @search.to_curl
  end
end