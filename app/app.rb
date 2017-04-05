ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './datamapper_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    @user = User.first
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

  get '/signup' do
    erb :signup
  end

  post '/new_user' do
    user = User.create(email: params[:email],
                      password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
