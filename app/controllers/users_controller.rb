# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def new
    @user = User.new
    @user.slides.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      SlideCollection.new(@user.slides.select { |s| s.search_target? })
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, slides_attributes: [:element_type_id, :search_word, :before_word, :after_word, :active])
    end
end
