class CompaniesController < ApplicationController
  rescue_from(CompaniesHouse::Exceptions,
    with: :rescue_with_notification)

  def index
    search_companies = CompaniesHouse::SearchClient.call(params[:q]).result
    @companies = search_companies.map { |sc| Company.new(sc) }
  end

  def add_to_favorites
    Company.find_or_create_by(company_params)
    redirect_to saved_companies_path
  end

  def saved
    @companies = Company.all
  end

  private

  def company_params
    params.require(:company)
          .permit(:company_number, :title)
  end
end
