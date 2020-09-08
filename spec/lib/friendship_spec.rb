require 'rails_helper'
require 'friendship'

RSpec.describe "Friendship" do
    fixtures :users

    it "creates a friendship between user1 and user2" do
        user1 = users(:expert_1)
        user2 = users(:expert_2)

        expect(user1.friends.count).to eq 0
        expect(user2.friends.count).to eq 0

        Friendship.create(user1, user2)

        expect(user1.friends.count).to eq 1
        expect(user2.friends.count).to eq 1
    end
end