class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # POST /votes
  # POST /votes.json
  def create
    # @vote = Vote.new(vote_params)

    # retrieve the song
    song = Song.find(vote_params[:song_id].to_i)

    if (vote_params[:like] == "true")
      song.liked_by(current_user)
      redirect_to chart_items_path, notice: "#{song.name} was liked"
    else
      song.disliked_by(current_user)
      redirect_to chart_items_path, notice: "#{song.name} was disliked"
    end


    # respond_to do |format|
    #   if @vote.save
    #     format.html { redirect_to chart_items_path, notice: 'Vote was successfully created.' }
    #     format.json { render :show, status: :created, location: @vote }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @vote.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to chart_items_path, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:song_id, :user_id, :like)
    end
end
