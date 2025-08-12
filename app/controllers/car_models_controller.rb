class CarModelsController < ApplicationController
  before_action :set_car_model, only: [:show, :edit, :update, :destroy]

  def index
    @car_models = CarModel.includes(:make).order('makes.name ASC, car_models.name ASC')
  end

  def show

  end

  def new
    @car_model = CarModel.new
  end

  def edit
  end

  def create
    @car_model = CarModel.new(car_model_params)
    if @car_model.save
      redirect_to car_models_path, notice: 'Model was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @car_model.update(car_model_params)
      redirect_to car_models_path, notice: 'Model was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car_model.destroy
    redirect_to car_models_path, notice: 'Model was successfully deleted.'
  end

  private

  def set_car_model
    @car_model = CarModel.find(params[:id])
  end

  def car_model_params
    params.require(:car_model).permit(:name, :make_id)
  end
end
