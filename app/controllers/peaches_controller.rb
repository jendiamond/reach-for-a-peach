class PeachesController < ApplicationController
  def index
  	@peaches = Peach.all
  end

  def new
  	@peach = Peach.new
  end

  def create
  	@peach = Peach.new(peach_params)
  	if @peach.save
  		redirect_to @peach
  	else
  		render 'new'
  	end
  end

  def edit
    @peach = Peach.find(params[:id])
  end

  def update
    @peach = Peach.find(params[:id])
    if @peach.update(peach_params)
      redirect_to peaches_path
    else
      render 'edit'
    end
  end

  def show
    @peach = Peach.find(params[:id])
  end

  private

  def set_peach
    @peach = Peach.find(params[:id])
  end

  def peach_params
  	params.require(:peach).permit(:name, :deadline)
  end
end
