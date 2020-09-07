websites = [
    'http://www.rubyflow.com/p/lfpgkl-integrate-static-site-in-rails-application-using-middleman',
    'http://www.rubyflow.com/p/1hdher-modern-rails-flash-messages-with-viewcomponent-stimulus-tailwind-css',
    'http://www.rubyflow.com/p/gizr34-what-are-the-code-coverage-metrics-for-ruby-on-rails',
    'http://www.rubyflow.com/p/lfpgkl-integrate-static-site-in-rails-application-using-middleman',
    'http://www.rubyflow.com/p/hsghdj-ruby-next-0100-shorthand-hash-notation-and-more',
    'http://www.rubyflow.com/p/lfpgkl-integrate-static-site-in-rails-application-using-middleman',
    'http://www.rubyflow.com/p/uf831f-what-is-canary-deployment',
    'http://www.rubyflow.com/p/b3bqhp-rails-adds-a-minimal-flag-to-generate-a-new-application',
    'http://www.rubyflow.com/p/orkuuk-introduction-to-dsl-by-implementing-rake',
    'http://www.rubyflow.com/p/wfk8ga-rails-6-adds-support-to-persist-timezones-of-active-job'
]

user1 = User.create(full_name: 'Fernando Castellanos', email: 'fernando@mail.com', website_url: websites[0], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user2 = User.create(full_name: 'John Doe', email: 'john@mail.com', website_url: websites[1], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user3 = User.create(full_name: 'Jane Doe', email: 'jane@mail.com', website_url: websites[2], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user4 = User.create(full_name: 'Lucy Sky', email: 'lucy@mail.com', website_url: websites[3], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user5 = User.create(full_name: 'Eleanor Rigby', email: 'eleanor@mail.com', website_url: websites[4], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user6 = User.create(full_name: 'Saddie Johnson', email: 'saddie@mail.com', website_url: websites[5], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user7 = User.create(full_name: 'Bill Murray', email: 'bill@mail.com', website_url: websites[6], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user8 = User.create(full_name: 'Steve Zissou', email: 'steve@mail.com', website_url: websites[7], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user9 = User.create(full_name: 'Peter Venkman', email: 'peter@mail.com', website_url: websites[8], password: 'let.me.1n', password_confirmation: 'let.me.1n')
user10 = User.create(full_name: 'Martin Heiss', email: 'martin@mail.com', website_url: websites[9], password: 'let.me.1n', password_confirmation: 'let.me.1n')

require 'friendship'
# User 1 making friends
Friendship.create(user1, user2)
Friendship.create(user1, user3)
Friendship.create(user1, user4)
Friendship.create(user1, user5)

# User 2 making friends
Friendship.create(user2, user6)
Friendship.create(user2, user7)

# User 3 making friends
Friendship.create(user3, user8)
