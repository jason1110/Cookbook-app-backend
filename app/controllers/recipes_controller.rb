class RecipesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]
    def index 
        @recipe = Recipe.all
        render json: @recipe
    end

    def create
        @recipe = Recipe.create(
            title: params[:title],
            href: params[:href],
            thumbnail: params[:thumbnail],
            ingredients: params[:ingredients]
    )
        render json: @recipe, status: :created
    end

end
