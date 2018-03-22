class User < ApplicationRecord
    validates_presence_of :email
    validates_presence_of :password
    has_many :uploads
    has_many :comments
    scope :user_id, -> (email) {select("id").where(email: email)}

    def self.new_user(user_params)
        password = user_params[:password]
        confirm = user_params[:confirm_password]
        if validate_password(password, confirm)
            email = user_params[:email]
            salt = SecureRandom.hex
            password_hash = hash_password(password, salt)
            user = self.create(
                email: email,
                password: password_hash,
                salt: salt
                )
        else
            User.new
        end
    end

    def self.hash_password(password, salt)
        digest = OpenSSL::Digest::SHA256.new
        digest.update(password)
        digest.update(salt)
        digest.to_s
    end

    def self.validate_password(pass1, pass2)
        if pass1 == pass2
            true
        else
            false
        end
    end

    def self.sign_in(params)
        email = params[:signin][:email]
        password = params[:signin][:password]
        user = User.where(email: email).first
        validate_password(user[:password], hash_password(password, user[:salt]))
    end
end
