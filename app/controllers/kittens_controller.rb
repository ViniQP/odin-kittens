class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created successfully"
      redirect_to @kitten
    else
      flash.now[:error] =    
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @kitten = Kitten.find[params[:id]]
    @kitten.update!(kitte_params)
    if @kitten.save
      flash[:success] = "Kitten updated successfully"
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.delete(params[:id])
    flash[:success] = "Kitten deleted successfully"
    redirect_to root_path
  end

  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end

