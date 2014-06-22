require 'mechanize'
require 'addressable/uri'
require 'json'

class Searcher

  def initialize
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @url = URI 'https://www.google.com/'
    @queries = load_data
    @results = Array.new
  end

  def load_data
    JSON.parse(IO.read('data/terms.json'))
  end

  def do_search query
    @page = @agent.get URI.join(@url, "search?q=" + query.split.join("+"))

    item = @page.root.css('#search .srg li')

    result = item.map do |node|
      result_item = {
        :title => node.css('.r a').text,
        :url => node.css('.s ._Zd').text,
        :description => node.css('.s .st').text
      }
    end

    result = result.select do |item|
      item[:title] != ""
    end

    @results << result
  end

  def save_data
    File.open("data/results.json","w") do |f|
      f.write(@results.to_json)
    end
  end

  def run query = nil

    @queries.map do |query|
      do_search query
    end

    save_data
  end

end