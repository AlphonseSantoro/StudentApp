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

end
