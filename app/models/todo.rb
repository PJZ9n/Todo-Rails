class Todo < ApplicationRecord
  enum state: {progress: 0, success: 1}
  validates :title, :detail, presence: true
end
