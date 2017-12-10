class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    episodes = Episode.where(archived: false)
    render json: episodes, status: 200
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    episode = Episode.find_unarchived(params[:id])
    render json: episode, status: 200
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    episode = Episode.new(episode_params)
    if episode.save
      # render json: episode, status: 201, location: episode
      # render nothing: true, status: 204, location: episode
      # head 204, location: episode
      # head :no_content, location: episode
      
      if episode.save
        render json: episode, status: :created, location: episode
      else
        # render json: episode.errors, status: 422
        render json: episode.errors, status: unprocessable_entity
      end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    episode = Episode.find(params[:id])
    if episode.update(episode_params)
      render json: episode, status: 200
    else
      render json: episode.errors, status: 422
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    # episode = Episode.find(prams[:id])
    episode = Episode.find_unarchived(prams[:id])
    episode.archive
    head 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:title, :description)
    end
end
