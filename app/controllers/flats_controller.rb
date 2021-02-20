class FlatsController < ApplicationController
  before_action :set_flat, only: %i[ show edit update destroy ]
  before_action :set_new_flat, only: [:new, :index]

  # GET /flats or /flats.json
  def index
    @flats = Flat.order(created_at: :desc)
  end

  # GET /flats/1 or /flats/1.json
  def show
  end

  # GET /flats/new
  def new
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats or /flats.json
  def create
    @flat = Flat.new(flat_params)
    @flats = Flat.all

    respond_to do |format|
      if @flat.save
        format.html { redirect_to flats_path, notice: "Flat was successfully created." }
        format.json { render :show, status: :created, location: @flat }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flats/1 or /flats/1.json
  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to @flat, notice: "Flat was successfully updated." }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flats/1 or /flats/1.json
  def destroy
    @flat.destroy
    respond_to do |format|
      format.html { redirect_to flats_url, notice: "Flat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_new_flat
      @flat = Flat.new
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      @flat = Flat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flat_params
      params.require(:flat).permit(:name, :description, :address, :price_per_night)
    end
end
