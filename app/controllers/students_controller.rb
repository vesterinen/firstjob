class StudentsController < ApplicationController


  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
  end


private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :picture, :gender, :location, :bio, :birthday, :education_level, :mentor_id )
  end

end


