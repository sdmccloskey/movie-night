require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = events(:january)
  end

  test "has a valid fixture" do 
    assert @event.valid?
  end

  should have_many(:movies)
  should have_many(:votes)

  # test "requires n a date and time" do
  # @event.occurs_at =il
  # refute @event.valid?
  # end

  should validate_presence_of(:occurs_at)

  # test "requires a location" do
  # @event.location = nil
  # refute @event.valid?

  # @event.location = ""
  # refute @event.valid?

  # end
  should validate_presence_of(:location)


# test "does not allow two events at the same time and place" do 
# end

should validate_uniqueness_of(:location).
    scoped_to(:occurs_at).
    with_message('already an event scheduled there at that time').
    case_insensitive

end
