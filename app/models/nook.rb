class Nook < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # after_validation :geocode, if: :will_save_change_to_coordinates?
  has_many_attached :photos
  has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user
  has_many :footnotes

  def typed_location
    "#{longitude}, #{latitude}"
  end
end
