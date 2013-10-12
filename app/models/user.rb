class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
    validates :email, presence: true

    has_secure_password
end
