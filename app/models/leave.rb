class Leave < ActiveRecord::Base
  belongs_to :worker, :class_name => 'User'
end
