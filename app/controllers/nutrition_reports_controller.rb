class NutritionReportsController < ApplicationController
  # skip_before_action :authorized, only: [:index]
  
  def index
    @nutritionreports = NutritionReport.all.select { |report| report.user_id == current_user.id }
    render json: @nutritionreports
  end

  def create
    @nutritionreport = NutritionReport.create(user_id: params['user_id'], reportName: params['reportName'], intakeDate: params['intakeDate'], intakes: params['intakes'])
    render json: @nutritionreport
  end

  def show
    @nutritionreport = NutritionReport.find_by(id: params[:id])
    if @nutritionreport
      render json: @nutritionreport
    else
      render json: { error: 'Page not found' }, status: 404
    end
  end

  def update
    @nutritionreport = NutritionReport.find_by(id: params['id'])
    if @nutritionreport
      @nutritionreport.update(reportName: params['reportName'], intakeDate: params['intakeDate'], intakes: params['intakes'])
      render json: @nutritionreport
    else 
      render json: { error: 'Page not found' }, status: 404
    end
  end

  def destroy
    @nutritionreport = NutritionrReport.find(params['id'])
    @nutritionreport.destroy
    render json: {message:"Successfuly deleted"}, status: :no_content
  end

end
