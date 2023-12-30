class TagsController < ApplicationController
    skip_before_action :verify_authenticity_token

    #shows all available tags
    def index
        tags = Tag.all
        render json: tags
    end
    
end
