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

require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  def setup
    @venue = venues(:one)
  end

  test 'should have many activities' do
    assert_must have_many(:activities), @venue
  end

  test 'should validate presence of name' do
    assert_must validate_presence_of(:name), @venue
  end

  test 'should validate uniquness of name' do
    assert_must validate_uniqueness_of(:name), @venue
  end

  test 'should validate presence of phone' do
    assert_must validate_presence_of(:phone), @venue
  end

  test 'should validate presence of description' do
    assert_must validate_presence_of(:description), @venue
  end

  test 'by_name should order venues alphabetically' do
    venues = Venue.by_name
    assert_equal 'Mental crossfit',  venues.first.name
    assert_equal 'Yoga Place', venues.last.name
  end
end
