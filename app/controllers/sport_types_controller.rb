class SportTypesController < ApplicationController
  before_action :set_sport_type, only: [:show, :edit, :update, :destroy]

  # GET /sport_types
  # GET /sport_types.json
  def index
    @sport_types = SportType.all
  end

  # GET /sport_types/1
  # GET /sport_types/1.json
  def show
  end

  # GET /sport_types/new
  def new
    @sport_type = SportType.new
  end

  # GET /sport_types/1/edit
  def edit
  end

  # POST /sport_types
  # POST /sport_types.json
  def create
    @sport_type = SportType.new(sport_type_params)

    respond_to do |format|
      if @sport_type.save
        format.html { redirect_to @sport_type, notice: 'Sport type was successfully created.' }
        format.json { render :show, status: :created, location: @sport_type }
      else
        format.html { render :new }
        format.json { render json: @sport_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sport_types/1
  # PATCH/PUT /sport_types/1.json
  def update
    respond_to do |format|
      if @sport_type.update(sport_type_params)
        format.html { redirect_to @sport_type, notice: 'Sport type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sport_type }
      else
        format.html { render :edit }
        format.json { render json: @sport_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_types/1
  # DELETE /sport_types/1.json
  def destroy
    @sport_type.destroy
    respond_to do |format|
      format.html { redirect_to sport_types_url, notice: 'Sport type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_type
      @sport_type = SportType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_type_params
      params.require(:sport_type).permit(:code, :name, :record_status)
    end
end