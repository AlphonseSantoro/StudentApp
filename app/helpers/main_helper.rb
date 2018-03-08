module MainHelper

    def user(id)
        @name = User.find(id)
    end

    def note(id)
        @date = Upload.find(id)
    end
end
