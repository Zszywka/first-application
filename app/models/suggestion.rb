class Suggestion < ApplicationRecord
  validates :body, presence: true
  validates :author, presence: true
end
