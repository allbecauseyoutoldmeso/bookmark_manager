ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative './datamapper_setup.rb'

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
    link = Link.create(url: params[:url], title:  params[:title])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save 
    redirect '/links'
  end

end
