class Publisher < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  include ActiveModel::Dirty
  include RecordHistory
  before_update :record_history

end
