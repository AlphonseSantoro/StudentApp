class Upload < ActiveRecord::Base
    belongs_to :binary, dependent: :destroy

    def self.upload(params, user_id)
        @binary = params[:upload][:file_data]
        @filename = @binary.original_filename
        @filetype = @binary.content_type
        @size = @binary.size

        # Save file to Binary table
        @file = Binary.create(data: @binary)

        # Save file to upload table
        self.create(
            filename: @filename,
            filetype: @filetype,
            size: @size,
            binary_id: @file[:id],
            users_id: user_id
        )
    end
end
