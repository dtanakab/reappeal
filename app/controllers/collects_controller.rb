# frozen_string_literal: true

class CollectsController < ApplicationController
  before_action :set_collect, only: %i[show edit update destroy]

  # GET /collects
  # GET /collects.json
  def index
    @collects = Collect.all
  end

  # GET /collects/1
  # GET /collects/1.json
  def show; end

  # GET /collects/new
  def new
    @collect = Collect.new
  end

  # GET /collects/1/edit
  def edit; end

  # POST /collects
  # POST /collects.json
  def create
    @collect = Collect.new(collect_params)
    if @collect.save
      redirect_to @collect, notice: "Collect was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /collects/1
  # PATCH/PUT /collects/1.json
  def update
    if @collect.update(collect_params)
      redirect_to @collect, notice: "Collect was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /collects/1
  # DELETE /collects/1.json
  def destroy
    @collect.destroy
    redirect_to collects_url, notice: "Collect was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_collect
      @collect = Collect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collect_params
      params.require(:collect).permit(:name, :file_name)
    end
end
