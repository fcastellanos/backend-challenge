require 'rails_helper'

RSpec.describe Heading, type: :model do
    context "validations" do
        it "validates the presence of user_id" do
            user = Heading.new

            expect(user).to_not be_valid
            expect(user.errors.messages[:user_id]).to eq ["can't be blank"]
        end

        it "validates the presence of content" do
            user = Heading.new

            expect(user).to_not be_valid
            expect(user.errors.messages[:content]).to eq ["can't be blank"]
        end
    end

    context "associations" do
        it "should belong to a user" do
            t = Heading.reflect_on_association(:user)
            
            expect(t.macro).to eq(:belongs_to)
        end
    end
end