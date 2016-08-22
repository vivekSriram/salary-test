class SalfilesController < ApplicationController
  def index
  	@salfiles = Salfile.all
  end

  def new
  	@salfile = Salfile.new
  end

  def create
  	@salfile = Salfile.new(salfile_params)
  	if @salfile.save
  		redirect_to salfiles_path, notice: "The file is uploaded"
  	else
  		render 'new'
  	end
  end

  def destroy
  	@salfile = Salfile.find(params[:id])
  	@salfile.destroy
  	redirect_to salfiles_path, notice: "The uploaded file deleted"
  end

  private
  	def salfile_params
  		params.require(:salfile).permit(:name, :attachment)
  	end

end
