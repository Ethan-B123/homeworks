class Album < ApplicationRecord
  validates :title, :band_id, :year, null: false
  belongs_to :band
end
