class User < ApplicationRecord

  has_many :projects, dependent: :destroy

  email_regex = /@/

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: {with: email_regex}
            
  passwordless_with :email

  def self.fetch_resource_for_passwordless(email)
    find_or_create_by(email:)
  end

end
