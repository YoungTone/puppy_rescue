class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all.order(:name)
    render :index

  def new
    @puppies = Puppy.new
  end

  def create
    @puppy = Puppy.new puppy_params
    if @puppy.save
      redirect_to "/puppies", notice: "Puppy Added!"
    else
      flash[:fail] = "Complete the form"
      render :new
    end
  end 

  def show
    @puppy = Puppy.find(params[:id])
  end

  def edit
    @puppy = Puppy.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @puppy.update(puppy_params)
      redirect_to puppy_path
    else
      flash[:fail] = "Complete the form"
      render :edit
    end
  end

  def destroy
    @puppy = Puppy.find(params[:id])
    @puppy.destroy
    redirect_to puppy_path alert:
    "Puppy succesfully removed"
  end

  private 

  def puppy_params
    params.require(:puppy).permit(:name, :age, :bio, :imgurl)
  end


end
