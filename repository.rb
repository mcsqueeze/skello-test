class Repository
  require_relative "database"
  require_relative "article"

  def initialize
    @articles = DB.map.with_index do |a, i|
    Article.new(a[:title], a[:content], a[:photo], a[:rating], COMMENTS[i])
    end
  end

  def add_article(title, content, photo)
    @articles << Article.new(title, content, photo, nil, nil)
    return @articles
  end

  def all
    @articles
  end
end
