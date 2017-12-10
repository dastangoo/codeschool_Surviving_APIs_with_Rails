module V2
  class ZombiesController < VersionController
    before_action ->{ @remote_ip  = request.headers['REMOTE_ADDR'] }
    before_action :audit_logging_for_v2
    
    def index
      render json: "#{@remote_ip} Version Two!", status: 200
    end
    
    def audit_logging_for_v2
      
    end
  end
end
