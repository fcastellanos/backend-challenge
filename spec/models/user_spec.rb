 require 'rails_helper'

RSpec.describe User, type: :model do
    context "validations" do
        it "does not save without email" do
            user = User.new

            expect(user).to_not be_valid
            expect(user.errors.messages[:email]).to eq ["can't be blank"]
        end

        it "does not save without password" do
            user = User.new

            expect(user).to_not be_valid
            expect(user.errors.messages[:password]).to eq ["can't be blank"]
        end

        it "does not save without full_name" do
            user = User.new

            expect(user).to_not be_valid
            expect(user.errors.messages[:full_name]).to eq ["can't be blank"]
        end

        it "does not save without website_url" do
            user = User.new

            expect(user).to_not be_valid
            expect(user.errors.messages[:website_url]).to eq ["can't be blank"]
        end

        it "saves the user" do
            ActiveJob::Base.queue_adapter = :test

            user = User.create(
                full_name: 'Fernando Castellanos', 
                email: 'fernando@mail.com', 
                website_url: 'http://www.rubyflow.com/p/lfpgkl-integrate-static-site-in-rails-application-using-middleman',
                password: 'let.me.1n', 
                password_confirmation: 'let.me.1n'
            )

            expect(user).to be_valid
        end
    end

    context "associations" do
        it "should have many headings" do
            t = User.reflect_on_association(:headings)
            
            expect(t.macro).to eq(:has_many)
        end

        it "should have many friends" do
            t = User.reflect_on_association(:friends)
            
            expect(t.macro).to eq(:has_many)
        end
    end

    context "callbacks" do
        it "enqueues a shorten url job in after_create" do
            ActiveJob::Base.queue_adapter = :test

            User.create(
                full_name: 'Fernando Castellanos', 
                email: 'fernando@mail.com', 
                website_url: 'http://www.rubyflow.com/p/lfpgkl-integrate-static-site-in-rails-application-using-middleman',
                password: 'let.me.1n', 
                password_confirmation: 'let.me.1n'
            )

            expect(ShortenUserWebsiteUrlJob).to have_been_enqueued
        end

        it "enqueues a fetch user headings job in after_create" do
            ActiveJob::Base.queue_adapter = :test
            
            User.create(
                full_name: 'Fernando Castellanos', 
                email: 'fernando@mail.com', 
                website_url: 'http://www.rubyflow.com/p/lfpgkl-integrate-static-site-in-rails-application-using-middleman',
                password: 'let.me.1n', 
                password_confirmation: 'let.me.1n'
            )

            expect(FetchUserHeadingsJob).to have_been_enqueued
        end
    end
end