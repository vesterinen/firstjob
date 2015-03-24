class MentorsController < ApplicationController

  def index
    @mentors = Mentor.all
  end

  def new
    @mentor = Mentor.new
  end

  def show
    @mentor = Mentor.find(params[:id])
  end

  def edit
    @mentor = Mentor.find(params[:id])
  end

  def update
    @mentor = Mentor.find(params[:id])
    @mentor.update(mentor_params)
    redirect_to mentor_path(@mentor)
  end

  def create
    @mentor = Mentor.new(mentor_params)
    @mentor.save
  end


private
  def mentor_params
    params.require(:mentor).permit(:first_name, :last_name, :picture, :gender, :employment_status, :location, :bio, :birthday, :student_id)
  end


end
