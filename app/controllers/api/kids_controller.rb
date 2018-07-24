class Api::KidsController < ApplicationController
  def index
    @kids = Kid.all
    render 'index.json.jbuilder'
  end

  def show
    kid_id = params[:id]
    @kid =Kid.find(kid_id)
    render 'show.json.jbuilder'    
  end

  def create
    @kid = Kid.new(
      name: params[:name],
      age: params[:age],
      grade: params[:grade],
      teacher: params[:teacher],
      school: params[:school],
      image: params[:image_url], 
      user_id: current_user.id
      )
    if @kid.save
    render 'show.json.jbuilder'
    else
    render json: {errors: @kid.errors.full_messages}, status: :unprocessable_entity
    end
  
  end

  def update
    
    @kid = Kid.find(params[:id])

    @kid.name = params[:name] || @kid.name
    @kid.age = params[:age] || @kid.age
    @kid.grade = params[:grade] || @kid.grade
    @kid.teacher = params[:teacher] || @kid.teacher
    @kid.school = params[:school] || @kid.school
    @kid.image_url = params[:image_url] || @kid.image_url
    
    if @kid.save
     render 'show.json.jbuilder'
    else
     render json: {errors: @kid.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    
    @kid = Kid.find(params[:id])
    @kid.destroy
    render json: {message: "Kid successfully removed"}
  end
end
