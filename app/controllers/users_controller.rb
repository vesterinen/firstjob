class UsersController < ApplicationController

  # def index
  #   # @mentors = User.where(role: "mentor") #change to arel
  #   # @students = User.where(role: "student")
  #   @users = User.where(role: "mentor")
  #   @users = User.where(role: "student")
  # end

  def students_index
    @users = User.where(role: "student")
    render :index
  end

  def mentors_index
    @users = User.where(role: "mentor")
    render :index
  end

  def show
    @user = User.find(params[:id])
    # @mentors = User.find_by(role: "mentor")
    # @students = User.find_by(role: "student")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    # respond_to do |format|
      # if @user.save
      #   format.hmtl{redirect_to @user, notice: "user successfully created"}
      #   format.json{render action: "show", status: :created, location: @user}
      # else
      #   format.hmtl{render action: "new"}
      #   format.json{render json: @user.errors, status: :unprocessable_entity}
      # end
    # end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :picture, :gender, :location, :bio, :email, :birthday, :education_level, :linkedin_url, :employment_status, :industry)
  end

end



