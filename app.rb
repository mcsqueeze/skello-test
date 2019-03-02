require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"
require_relative "article"
require_relative "repository"

get '/' do
  @articles = Repository.new.all
  erb :index
end

get '/:search' do
  unless params[:query].nil?
    @query = params[:query].downcase
    @articles = Repository.new.all
    @articles = @articles.select do |a|
      (a.title.downcase.include? "#{@query}") || (a.content.downcase.include? "#{@query}")
    end
  end
  erb :index
end

post '/:postnewarticle' do
  repository = Repository.new
  @articles = repository.all
  @articles = repository.add_article(params[:title], params[:content], params[:photo])
  erb :index
end
