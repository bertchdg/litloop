class Nook < ApplicationRecord
  belongs_to :user
  after_validation :geocode, if: :will_save_change_to_coordinates?
end