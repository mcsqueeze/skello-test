class Article
  require_relative "database"
  attr_accessor :title, :content, :photo, :rating, :comments

  def initialize(title, content, photo, rating = nil, comments = nil)
    @title = title
    @content = content
    @photo = photo
    @rating = rating
    @comments = comments
  end
end
