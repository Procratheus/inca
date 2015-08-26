class Content < ActiveRecord::Base
  belongs_to :publisher
  # Record Changes to Records
  include RecordHistory
  before_update :record_history

end
