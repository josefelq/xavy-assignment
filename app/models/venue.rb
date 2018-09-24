# == Schema Information
#
# Table name: venues
#
#  id          :bigint(8)        not null, primary key
#  description :string(255)
#  name        :string(255)
#  phone       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Venue < ApplicationRecord
  has_one_attached :image
  has_many :activities, dependent: :destroy

  scope :by_name, -> { order(:name) }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :phone, presence: true
end
