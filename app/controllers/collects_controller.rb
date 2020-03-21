# frozen_string_literal: true

class CollectsController < ApplicationController
  before_action :set_collect, only: %i[show edit update destroy]

  def index
    @collects = Collect.all
  end

  def show; end

  def new
    @collect = Collect.new
  end

  def edit; end

  def create
    @collect = Collect.new(collect_params)
    @collect.url = @collect.fetch_image_url
    if @collect.save
      @collect.save_image
      ArrangeImage.new("public/images_for_movie/#{@collect.id}.jpg", @collect.name + @collect.file_name)
      redirect_to collects_path, notice: "Collect was successfully created."
    else
      render :new
    end
  end

  def update
    if @collect.update(collect_params)
      redirect_to @collect, notice: "Collect was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @collect.destroy
    redirect_to collects_url, notice: "Collect was successfully destroyed."
  end

  private
    def set_collect
      @collect = Collect.find(params[:id])
    end

    def collect_params
      params.require(:collect).permit(:name, :file_name, :image, :url)
    end
end
