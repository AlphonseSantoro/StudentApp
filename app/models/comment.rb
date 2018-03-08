class Comment < ActiveRecord::Base
    belongs_to :upload, dependent: :destroy
    has_one :user

    def self.new_comment(params)
        puts params[:user_id]
        self.create(
            text: params[:text],
            upload_id: params[:upload_id],
            user_id: params[:user_id]
        )
    end
end
