# == Schema Information
#
# Table name: activities
#
#  id          :bigint(8)        not null, primary key
#  description :text(65535)
#  difficulty  :integer
#  name        :string(255)
#  schedule    :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  venue_id    :bigint(8)
#
# Indexes
#
#  index_activities_on_venue_id  (venue_id)
#
# Foreign Keys
#
#  fk_rails_...  (venue_id => venues.id)
#

class Activity < ApplicationRecord

  DIFFICULTIES = {1 => "Baja", 2 => "Media", 3 => "Alta" }
  acts_as_taggable
  belongs_to :venue


  scope :by_name, -> { order(:name) }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :schedule, presence: true
end
