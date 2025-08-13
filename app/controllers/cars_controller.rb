class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.includes(:make, :car_model, :year).order('makes.name ASC, car_models.name ASC, years.year DESC')
  end

  def show; end

  def new
    @car    = Car.new
    @makes  = Make.order(:name)
    @models = []
    @years  = []
  end

  def edit
  end

  def create
    @car = Car.new(car_params)

    @makes  = Make.order(:name)
    @models = CarModel.where(make_id: @car.make_id).order(:name)
    @years  = Year.where(make_id: @car.make_id, car_model_id: @car.car_model_id).order(year: :desc)

    if @car.save
      redirect_to cars_path, notice: "Car was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @makes  = Make.order(:name)
    @models = CarModel.where(make_id: car_params[:make_id]).order(:name)
    @years  = Year.where(make_id: car_params[:make_id], car_model_id: car_params[:car_model_id]).order(year: :desc)

    if @car.update(car_params)
      redirect_to cars_path, notice: "Car was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: "Car was successfully deleted."
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make_id, :car_model_id, :year_id, :trim, :count)
  end
end
