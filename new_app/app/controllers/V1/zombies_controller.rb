module V1
  class ZombiesController < ApplicationController
    before_action ->{ @remote_ip = request.headers['REMOTE_ADDR']}
    def index
      render json: "#{@remote_ip} Version One!", status: 200
    end
  end
end