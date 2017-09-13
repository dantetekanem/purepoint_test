class RecipePuppy
  include HTTParty
  base_uri "http://www.recipepuppy.com/api/"

  attr_reader :query

  def self.search(query, page = 1)
    self.new(query).fetch(page: page) + self.new(query).fetch(page: page + 1)
  end

  def initialize(query)
    @query = query
  end

  def fetch(page: 1)
    parse(self.class.get("?q=#{query}&p=#{page}"))['results']
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
