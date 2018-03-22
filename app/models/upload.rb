class Upload < ApplicationRecord
    belongs_to :binary, dependent: :destroy
    validates_presence_of :user_id, :filename, :filetype, :size, :path
    has_many :comments

    def self.upload(params, user_id)
        directory = "public/data/#{ user_id[:id]}"
        Dir.mkdir("public/data/#{user_id[:id]}") unless File.exists?(directory)
        file = params[:upload][:file_data]
        filename = file.original_filename
        filetype = file.content_type
        size = file.size

        path = File.join(directory, filename)
        File.open(path, "wb") { |f| f.write(file.read) }
        
        # Save file to upload table
        self.create(
            filename: filename,
            filetype: filetype,
            size: size,
            user_id: user_id[:id],
            path: path,
            description: params[:upload][:description]
        )
    end
end
