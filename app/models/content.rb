class Content < ActiveRecord::Base
  belongs_to :publisher
  include ActiveModel::Dirty
end
