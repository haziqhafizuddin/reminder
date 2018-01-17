class StrideGroup < ApplicationRecord
  enum action_type: { standup: 0, daily_scrum: 1 }

  def self.create_automatically(data)
    data['values'].each do |value|
      find_or_create_by(
        cloud_id: value['cloudId'],
        group_id: value['id'],
        name: value['name']
      )
    end
  end
end
