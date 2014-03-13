class GroupingsController < ApplicationController
  before_action :set_grouping, only: [:show, :edit, :update, :destroy]

  # GET /groupings
  # GET /groupings.json
  def index
    @groupings = Grouping.all
  end

  # GET /groupings/1
  # GET /groupings/1.json
  def show
  end

  # GET /groupings/new
  def new
    @grouping = Grouping.new
  end

  # GET /groupings/1/edit
  def edit
  end

  # POST /groupings
  # POST /groupings.json
  def create
    @grouping = Grouping.new(grouping_params)

    respond_to do |format|
      if @grouping.save
        format.html { redirect_to @grouping, notice: 'Grouping was successfully created.' }
        format.json { render action: 'show', status: :created, location: @grouping }
      else
        format.html { render action: 'new' }
        format.json { render json: @grouping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupings/1
  # PATCH/PUT /groupings/1.json
  def update
    respond_to do |format|
      if @grouping.update(grouping_params)
        format.html { redirect_to @grouping, notice: 'Grouping was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @grouping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupings/1
  # DELETE /groupings/1.json
  def destroy
    @grouping.destroy
    respond_to do |format|
      format.html { redirect_to groupings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grouping
      @grouping = Grouping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grouping_params
      params.require(:grouping).permit(:name)
    end
end
