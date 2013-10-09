class AutomobilesController < ApplicationController
  def new
    @automobile = Automobile.new
  end
 def index
   @automobiles = Automobile.all
 end
  def create
    @automobile = Automobile.new(automobile_params)
    if @automobile.save
      flash[:notice] = "Automobile was successfully recorded!"
      redirect_to new_automobile_path
    else
      render :new
  end
end

  def automobile_params
  params.require(:automobile).permit(:color, :year, :mileage, :description, :manufactuer_id)
 end
end