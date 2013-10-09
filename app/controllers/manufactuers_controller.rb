class ManufactuersController < ApplicationController
  def new
    @manufactuer = Manufactuer.new
  end

  def create
    @manufactuer = Manufactuer.new(manufactuer_params)
    if @manufactuer.save
      flash[:notice] = 'Manufactuer was successfully recorded!'
      redirect_to new_manufactuer_path
    else
      render :new
    end
  end

 def index
    @manufactuers = Manufactuer.all
  end

  def destroy 
    @manufactuer = Manufactuer.find(params[:id])
    @manufactuer.destroy
     redirect_to manufactuer_path, notice:'Manufactuer was successfully deleted'
 end 
  
  def show
    @manufactuers = Manufactuer.all
  end

  protected
  def manufactuer_params
    params.require(:manufactuer).permit(:name, :country)
  end
end

