class EpisodesController < ApplicationController
  before_action :authenticate

  # GET /episodes
  # GET /episodes.json
  def index
    episodes = Episode.all
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
  protected
    # def authenticate
    #   # Reads and decodes username and password from Authorization header
    #   authenticate_or_request_with_http_basic do |username, password|
    #     # Custom authentication strategy
    #     User.authenticate(username, password)
    #   end
    # end
    
    def authenticate
      # authenticate_basic_auth || render_unauthorized
      # Reads token from Authorization header
      
      # authenticate_or_request_with_http_token do |token, options|
      #   User.find_by(auth_token: token)
      # end
      
      # Pass custom realm name as arguement
      # authenticate_or_request_with_http_token('Episodes') do |token, options|
      #   User.find_by(auth_token: token)
      # end
      
      authenticate_token || render_unauthorized
    end
    
    def authenticate_basic_auth
      # Returns a boolean and does not halt the request
      authenticate_with_http_basic do |username, passowrd|
        User.authenticate(username, password)
      end
    end
    
    def render_unauthorized
      # Sets proper header
      # self.headers['WWW-Authenticate'] = 'Basic realm="Episodes"'
      self.headers['WWW-Authenticate'] = 'Token realm="Episodes"'
      
      # Responds to different headers
      respond_to do |format|
        format.json { render json: 'Bad credentials', status: 401 }
        format.xml { render xml: 'Bad credentials', status: 401 }
      end
    end
    
    def authenticate_token
      # returns a boolean and does not halt the request
      authenticate_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end
    
    
end
