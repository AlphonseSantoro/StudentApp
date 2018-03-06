class User < ActiveRecord::Base
    validates_presence_of :email
    validates_presence_of :password

    def self.new_user(user_params)
        password = user_params[:password]
        confirm = user_params[:confirm_password]
        email = user_params[:email]
        salt = SecureRandom.hex
        password_hash = hash_password(password, salt)
         @user = self.create(
            email: email,
            password: password_hash,
            salt: salt
            )
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
end
