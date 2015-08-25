class Publisher < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  include ActiveModel::Dirty
  scope :record_history, -> (user) { record_history(user) }

  protected

  def record_history(user)
    self.changes.each do |attribute_name, values|
      before_value = values[0].to_s.truncate(300) if values[0] != nil
      after_value = values[1].to_s.truncate(300) if values[1] != nil
      History.create! do
        attribute_name = attribute_name,
        before_value = before_value,
        after_value = after_value,
        object_name = self.class.name,
        object_id = self.id,
        user_id = user.id
      end
    end
  end

end
