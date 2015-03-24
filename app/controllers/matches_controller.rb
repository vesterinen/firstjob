class MatchesController < ApplicationController

  def index
    matches = Match.all
  end

  def new
    match = Match.new
  end

  def show
    match = Match.find(params[:id])
  end

  def edit
    match = Match.find(params[:id])
  end

  def update
    match = Match.find(params[:id])
    match.update(match_params)
    redirect_to match_path(match)
  end

  def create
    match = Match.new(match_params)
    match.save
  end


private
  def match_params
    params.require(:match).permit(:status)
  end


end
