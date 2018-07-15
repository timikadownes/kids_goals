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
      user_id: params[:user_id]
      )
    render 'show.json.jbuilder'
  end

  def update
    kid_id = params[:id]
    @kid = Kid.find(kid_id)

    @kid.name = params(:name)
    @kid.age = params(:age)
    @kid.grade = params(:grade)
    @kid.teacher = params(:teacher)
    @kid.school = params(:school)
    @kid.image_url = params(:image_url)
    
    @kid.save
    render 'show.json.jbuilder'
  end

  def destroy
    kid_id = params[:id]
    @kid = Kid.find(kid_id)
    @kid.destroy
    render json: {message: "Kid successfully removed"}
  end
end
