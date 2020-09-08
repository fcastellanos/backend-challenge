class SearchService
    def self.find_user_matchings(user, term)
        # Friends of the friends without including the user
        friends = HasFriendship::Friendship
            .where(friendable_id: user.friends.pluck(:id))
            .where('friend_id NOT IN (?)', [user.id])
            .as_json(only: [:friendable_id, :friend_id])

        # Just grab the friend of friend ids
        user_ids = friends.map {|k,v| k['friend_id'] }

        # Searching matchings from friends of friend documents by the term
        expert_ids = PgSearch.multisearch(term).where(user_id: user_ids).pluck(:user_id)

        # Once we have the matchings we filter the friends of friend list
        # by only the ones that returned results in the search
        friends.select {|f| expert_ids.include?(f["friend_id"]) }
    end
end
