require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works without raising an exception" do
  	assert_nothing_raised do
  	  UserFriendship.create user: users(:reid), friend: users(:evan)
    end
  end

  test "that creating a friendship based on user id and friend id works" do
  	UserFriendship.create user_id: users(:reid).id, friend_id: users(:evan).id
  	assert users(:reid).friends.include?(users(:evan))
  end
end
