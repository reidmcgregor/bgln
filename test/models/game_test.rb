require 'test_helper'

class GameTest < ActiveSupport::TestCase

	test "that a game requires a name" do
		game = Game.new
		assert !game.save
		assert !game.errors[:name].empty?
	end

	test "that the game name needs to be at least 2 letters long" do
		game = Game.new
		game.name = "M"
		assert !game.save
		assert !game.errors[:name].empty?
	end

	test "that a game has a user id" do
		game = Game.new
		game.name = "Machi Koro"
		assert !game.save
		assert !game.errors[:user_id].empty?
	end

end
