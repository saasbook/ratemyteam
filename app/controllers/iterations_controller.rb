class IterationsController < ApplicationController
  before_action :verify_is_admin
  before_action :set_iteration, only: [:show, :edit, :update, :destroy]

  # GET /iterations
  # GET /iterations.json
  def index
    @iterations = Iteration.all
  end

  # GET /iterations/1
  # GET /iterations/1.json
  def show
  end

  # GET /iterations/new
  def new
    @iteration = Iteration.new
  end

  # GET /iterations/1/edit
  def edit
  end

  # POST /iterations
  # POST /iterations.json
  def create
    #ActionController::Parameters.permit_all_parameters
    #params.require(:iteration).permit(:description, :start, :end, :lms_courseid)
    params.permit!
    @iteration = Iteration.new(iteration_params)

    respond_to do |format|
      if @iteration.save
        format.html { redirect_to @iteration, notice: 'Iteration was successfully created.' }
        format.json { render :show, status: :created, location: @iteration }
      else
        format.html { render :new }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iterations/1
  # PATCH/PUT /iterations/1.json
  def update
    params.require(:iteration).permit(:description, :start, :end, :lms_courseid)
    respond_to do |format|
      if @iteration.update(iteration_params)
        format.html { redirect_to @iteration, notice: 'Iteration was successfully updated.' }
        format.json { render :show, status: :ok, location: @iteration }
      else
        format.html { render :edit }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.json
  def destroy
    @iteration.destroy
    respond_to do |format|
      format.html { redirect_to iterations_url, notice: 'Iteration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iteration
      @iteration = Iteration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iteration_params
      params.fetch(:iteration, {})
    end

  def verify_is_admin
    head :forbidden unless Rails.env.development?
  end
end
