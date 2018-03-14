class Upload < ApplicationRecord
    belongs_to :binary, dependent: :destroy
    has_many :comments

    def self.upload(params, user_id)

        puts params
        @binary = params[:upload][:file_data]
        file = params[:upload][:file_data].read
        @filename = @binary.original_filename
        @filetype = @binary.content_type
        @size = @binary.size

        # Save file to upload table
        self.create(
            filename: @filename,
            filetype: @filetype,
            size: @size,
            user_id: user_id,
            data: file,
            description: params[:upload][:description]
        )
    end
end
