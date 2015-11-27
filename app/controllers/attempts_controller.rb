class AttemptsController < ApplicationController
	before_action :set_attempt, only: [:show, :update, :destroy]

  # GET /attempts
  # GET /attempts.json
  def index
    @attempts = Attempt.all
    @tests = Test.all
  end

  # GET /attempts/1
  # GET /attempts/1.json
  def show
    if @attempt.place
      @question = Question.find(@attempt.place)
    end
  end

  # GET /attempts/new
  def new
    @attempt = Attempt.new
  end

  # GET /attempts/1/edit
  def edit
    @attempt = Attempt.find(params[:attempt])
  end

  # POST /attempts
  # POST /attempts.json
  def create
    @attempt = Attempt.new(attempt_params)

    respond_to do |format|
      if @attempt.save
        format.html { redirect_to @attempt, notice: 'Successfully saved.' }
        format.json { render :show, status: :created, location: @attempt }
      else
        format.html { redirect_to :dashboard, notice: "There was a problem trying to save your place." }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempts/1
  # PATCH/PUT /attempts/1.json
  def update
    respond_to do |format|
      if @attempt.update(attempt_params)
        format.html { redirect_to @attempt, notice: 'Successfully saved.' }
        format.json { render :show, status: :ok, location: @attempt }
      else
        format.html { redirect_to :dashboard, notice: "There was a problem trying to save your place." }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1
  # DELETE /attempts/1.json
  def destroy
    @attempt.destroy
    respond_to do |format|
      format.html { redirect_to attempts_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attempt_params
      params.require(:attempt).permit(:test_id, :score, :place, :completed, :user_id, :incorrect)
    end
end
