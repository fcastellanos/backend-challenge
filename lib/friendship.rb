class Friendship
    def self.create(user1, user2)
        user1.friend_request(user2)
        user2.accept_request(user1)
    end
end
