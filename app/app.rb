ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
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
    params[:tag].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
