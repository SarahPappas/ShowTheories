class TheoriesController < ApplicationController
  before_action :set_theory, only: [:show, :update, :destroy, :upvote, :downvote]
  before_action :set_vote, only: [:upvote, :downvote]

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

  # PUT /theories/1/upvote
  def upvote
    if @vote.length > 0
      puts @vote.inspect
      # render json: @vote
      # render json: @vote, status: :error, location: @vote
      render :json =>{:error => "You've already voted"}.to_json, :status => 400 
    else
      @vote = Vote.new(theory_id: params[:id], ipAddress: request.remote_ip)
      if @vote.save
        if @theory.increment!(:upvotesCount, 1)
          puts @theory.inspect
          render json: @theory
        else
          puts @vote.inspect
          render json: @theory.errors, status: :unprocessable_entity
        end
      else
        render json: @vote
        render :json =>{:error => "Save failed"}.to_json, :status => 400 
        # json: @vote.errors, status: :unprocessable_entity
      end
    end
  end

  # PUT /theories/1/upvote
  def downvote
    if @theory.increment!(:downvotesCount, 1)
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
    def set_vote
      ip = request.remote_ip
      # @vote = Vote.first :conditions => {:theory_id=>params[:id], :ipAddress=>ip}
      @vote = Vote.where(:theory_id=>params[:id]).where(:ipAddress=>ip)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_theory
      @theory = Theory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def theory_params
      params.require(:theory).permit(:content, :authorName, :showTitle, :upvotesCount, :downvotesCount)
    end
end
