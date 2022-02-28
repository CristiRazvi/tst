require 'json'

class CompaniesHouse::BasicClient < Patterns::Service
  TIMEOUT = 20

  def call
    parsed_response
  end

  private

  def api_key
    @api_key ||= ENV['COMPANIES_HOUSE_API_KEY']
  end

  def connection
    conn = Faraday.new(
      url: self.class::REQUEST_URL,
      params: @params
    )
    conn.options.timeout = TIMEOUT
    conn.request(:authorization, :basic, api_key, '')
    conn
  end

  def response
    response = connection.get # this can be changed to manage other HTTP verbs as well
    raise CompaniesHouse::Exceptions.new("Companies House API error: #{response.reason_phrase}") if response.status != 200

    response.body
  end

  def json_response
    @json_response ||= JSON.parse(response)
  end

  def parsed_response
    json_response['items'].map { |item|  item.slice('title', 'company_number') }
  end
end
