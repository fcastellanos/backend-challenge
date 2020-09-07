class User < ApplicationRecord
  validates :full_name, presence: true, uniqueness: true
  validates :website_url, presence: true

  after_create :schedule_jobs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :headings

  private

    def schedule_jobs
      ShortenUserWebsiteUrlJob.perform_later(self.id, self.website_url)
      FetchUserHeadingsJob.perform_later(self.id, self.website_url)
    end
end
