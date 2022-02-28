require 'json'

class CompaniesHouse::SearchClient < CompaniesHouse::BasicClient
  REQUEST_URL = 'https://api.company-information.service.gov.uk/search/companies'

  def initialize(q)
    @params = { q: q }
  end
end
