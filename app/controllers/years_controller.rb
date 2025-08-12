# app/controllers/years_controller.rb
class YearsController < ApplicationController
  before_action :set_year, only: [:show, :edit, :update, :destroy]

  def index
    @years = Year.includes(:make, :car_model).order(year: :desc)
  end

  def show; end

  def new
    @year = Year.new
    @makes = Make.order(:name)
    @models = [] # will be populated by JS after Make is chosen
  end

  def edit
    @makes  = Make.order(:name)
    @models = CarModel.where(make_id: @year.make_id).order(:name)
  end

  def create
    @year = Year.new(year_params)
    @makes = Make.order(:name)
    @models = CarModel.where(make_id: @year.make_id).order(:name)

    if @year.save
      redirect_to years_path, notice: "Year was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @makes = Make.order(:name)
    @models = CarModel.where(make_id: year_params[:make_id]).order(:name)

    if @year.update(year_params)
      redirect_to years_path, notice: "Year was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @year.destroy
    redirect_to years_path, notice: "Year was successfully deleted."
  end

  private

  def set_year
    @year = Year.find(params[:id])
  end

  def year_params
    params.require(:year).permit(:year, :make_id, :car_model_id)
  end
end
