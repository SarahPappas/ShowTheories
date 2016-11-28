class TheoriesController < ApplicationController
  before_action :set_theory, only: [:show, :update, :destroy]

  # GET /theories
  def index
    @theories = Theory.all

    render json: @theories
  end

  # GET /theories/1
  def show
    render json: @theory
  end

  # POST /theories
  def create
    @theory = Theory.new(theory_params)

    if @theory.save
      render json: @theory, status: :created, location: @theory
    else
      render json: @theory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /theories/1
  def update
    if @theory.update(theory_params)
      render json: @theory
    else
      render json: @theory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /theories/1
  def destroy
    @theory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theory
      @theory = Theory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def theory_params
      params.require(:theory).permit(:content, :authorName, :upvotesCount, :downvotesCount)
    end
end
