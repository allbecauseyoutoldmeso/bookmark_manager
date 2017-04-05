ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :'links/index'
  end

  get '/add_link' do
    erb :'links/add_link'
  end

  post '/create_link' do
    Link.create(url: params[:url], title:  params[:title])
    Tag.create(title: params[:tag])
    redirect '/links'
  end

end
