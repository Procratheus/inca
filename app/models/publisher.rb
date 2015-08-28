class Publisher < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  include ActiveModel::Dirty

end
