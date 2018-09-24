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

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @activity = activities(:one)
  end

  test 'should validate presence of name' do
    assert_must validate_presence_of(:name), @activity
  end

  test 'should validate uniquness of name' do
    assert_must validate_uniqueness_of(:name), @activity
  end

  test 'should validate presence of description' do
    assert_must validate_presence_of(:description), @activity
  end

  test 'should validate presence of schedule' do
    assert_must validate_presence_of(:schedule), @activity
  end

  test 'by_name should order activities alphabetically' do
    activities = Activity.by_name
    assert_equal 'Clase de crossfit', activities.first.name
    assert_equal 'Kundalini yoga', activities.last.name
  end
end
