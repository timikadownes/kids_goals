class Api::UsersController < ApplicationController

  def show
  #profile page
  user_id = params[:id]
  @user = User.find_by(id: user_id)

  render 'show.json.jbuilder'  

  end

  def create 
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status:
      :unprocessable_entity
    end
  end


end



