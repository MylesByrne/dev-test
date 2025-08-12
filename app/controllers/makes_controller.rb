class MakesController < ApplicationController
  before_action :set_make, only: [:show, :edit, :update, :destroy]

  def index
    @makes = Make.all.order(:name)
  end

  def show
  end

  def new
    @make = Make.new
  end

  def edit
  end

  def create
    @make = Make.new(make_params)
    if @make.save
      redirect_to makes_path, notice: 'Make was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @make.update(make_params)
      redirect_to makes_path, notice: 'Make was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @make.destroy
    redirect_to makes_path, notice: 'Make was successfully deleted.'
  end

  private

  def set_make
    @make = Make.find(params[:id])
  end

  def make_params
    params.require(:make).permit(:name)
  end

end
