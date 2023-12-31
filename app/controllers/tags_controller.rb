class TagsController < ApplicationController
    
    #shows all available tags
    def index
        tags = Tag.all
        render json: tags
    end
    
end
