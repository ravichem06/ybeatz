class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  layout "community"
  before_filter :authenticate_member!, except: [:index, :show]
  require 'will_paginate/array'

  # GET /communities
  # GET /communities.json
  def index
    @communities = Community.newest_first.where(params[:slug]).paginate(page: params[:page], per_page: 9)
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    
    @communities = Community.newest_first.where(params[:slug]).paginate(page: params[:page], per_page: 5)

  end

  # GET /communities/new
  def new
    @community = Community.new({:member_id => current_member.id})
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)

    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: "Post: #{@community.title.capitalize} was successfully created." }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: "Post: #{@community.title.capitalize} was successfully updated." }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: "Post: #{@community.title.capitalize} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:name,:post_image, :title, :content, :member_id)
    end

    


    
end
