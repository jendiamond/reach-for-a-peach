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
  		redirect_to peach
  	else
  		render 'new'
  	end
  end

  def show
    @peach = Peach.find(params[:id])
  end

  private

  def peach_params
  	params.require(:peach).permit(:name, :deadline)
  end
end
