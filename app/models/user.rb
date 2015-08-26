class User < ActiveRecord::Base
    before_save { email.downcase! }

    validates :name, presence: true,
                     length: {maximum: 50}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      length: {maximum: 50},
                      format: {with: VALID_EMAIL_REGEX},
                      uniqueness: { case_sensitive: false}
    has_secure_password                      
    validates :password, presence: true,    
                         length: {minimum: 6}

    def self.update_pass id, password
      to_save_pass = BCrypt::Password.create(password)
      User.find(id).update_attribute(:password_digest, to_save_pass)
    end
end