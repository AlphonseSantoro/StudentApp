module MainHelper

    def user(id)
        @name = User.find(id)
    end

    def note(id)
        @date = Upload.find(id)
    end
    
    def document(params)
        document = Upload.find(params[:format])
    end

    def setParams(id)
        params[:format] = id
    end

    def google_map(center)
        "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
      end

end
