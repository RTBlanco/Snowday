class Report < ApplicationRecord
  belongs_to :location

  validates :inches, presence: true
end
