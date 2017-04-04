require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, "postgres://localhost/datamapper_play")

class Link

  include DataMapper::Resource
  property :title String
  property :url String






end
