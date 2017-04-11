class UserDepartment < ApplicationRecord
  belongs_to :user
  belongs_to :department, counter_cache: :user_count
end
