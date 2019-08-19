class User < ActiveRecord::Base
has_many: favourite_sources 
has_many: favourite_articles 
end
