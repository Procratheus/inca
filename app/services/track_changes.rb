module TrackChanges

  class RecordHistory
    include ActiveModel::Dirty

    def self.call
      write_history
    end

    def write_history
      self.changes.each do |attribute_name, values|
        before_value = values[0].to_s.truncate(300) if values[0] != nil
        after_value = values[1].to_s.truncate(300) if values[1] != nil
        History.create! do
          attribute_name = attribute_name,
          before_value = before_value,
          after_value = after_value,
          object_name = self.class.name,
          object_id = self.id,
          user_id = current_user.id
        end
      end
    end

  end

end