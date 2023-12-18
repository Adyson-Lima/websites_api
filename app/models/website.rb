class Website < ApplicationRecord
  validates :url, :description, presence: true
end
