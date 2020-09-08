require 'search_service'

class SearchController < ApplicationController
    def show
        user = User.find params[:user_id]

        matchings = SearchService.find_user_matchings(user, params[:term])

        matchings = matchings.map do |match|
            {
                friend1: User.find(match['friendable_id']),
                friend2: User.find(match['friend_id'])
            }
        end

        @data = {
            user: user,
            matchings: matchings
        }

        respond_to do |format|
            format.js {render layout: false} # Add this line to you respond_to block
        end
    end
end