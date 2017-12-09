class MedicalKitsController < ApplicationController
  before_action :set_medical_kit, only: [:show, :edit, :update, :destroy]

  # GET /medical_kits
  # GET /medical_kits.json
  def index
    @medical_kits = MedicalKit.all
  end

  # GET /medical_kits/1
  # GET /medical_kits/1.json
  def show
  end

  # GET /medical_kits/new
  def new
    @medical_kit = MedicalKit.new
  end

  # GET /medical_kits/1/edit
  def edit
  end

  # POST /medical_kits
  # POST /medical_kits.json
  def create
    @medical_kit = MedicalKit.new(medical_kit_params)

    respond_to do |format|
      if @medical_kit.save
        format.html { redirect_to @medical_kit, notice: 'Medical kit was successfully created.' }
        format.json { render :show, status: :created, location: @medical_kit }
      else
        format.html { render :new }
        format.json { render json: @medical_kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_kits/1
  # PATCH/PUT /medical_kits/1.json
  def update
    respond_to do |format|
      if @medical_kit.update(medical_kit_params)
        format.html { redirect_to @medical_kit, notice: 'Medical kit was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_kit }
      else
        format.html { render :edit }
        format.json { render json: @medical_kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_kits/1
  # DELETE /medical_kits/1.json
  def destroy
    @medical_kit.destroy
    respond_to do |format|
      format.html { redirect_to medical_kits_url, notice: 'Medical kit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_kit
      @medical_kit = MedicalKit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_kit_params
      params.require(:medical_kit).permit(:name, :components)
    end
end
