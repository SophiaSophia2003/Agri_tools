class Administrators::ProvincesController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_province, only: [:show, :edit, :update, :destroy]

  def index
    @provinces = Province.all
  end

  def show
  end

  def new
    @province = Province.new
  end

  def create
    @province = Province.new(province_params)
    if @province.save
      redirect_to administrators_province_path(@province), notice: 'Province was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @province.update(province_params)
      redirect_to administrators_province_path(@province), notice: 'Province was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @province.destroy
    redirect_to administrators_provinces_path, notice: 'Province was successfully deleted.'
  end

  private

  def set_province
    @province = Province.find(params[:id])
    
  end

  def province_params
    params.require(:province).permit(:gst_rate, :pst_rate, :hst_rate,:name)
  end
end
