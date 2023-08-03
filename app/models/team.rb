class Team < ApplicationRecord
  validates :name, presence: true
  belongs_to :division, optional: true
end
