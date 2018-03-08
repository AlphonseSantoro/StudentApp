class Comment < ActiveRecord::Base
    belongs_to :upload, dependent: :destroy
    has_one :user

    def self.new_comment(params)
        self.create(
            text: params[:text],
            upload_id: params[:document_id],
            user_id: params[:user_id]
        )
    end
end
