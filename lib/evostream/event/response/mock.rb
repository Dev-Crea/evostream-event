# frozen_string_literal: true

# rubocop:disable Style/EvalWithLocation
module Net
  # Override Net::HTTPResponse for create response with body
  class HTTPResponse
    def self.mock(body = {}.to_json)
      # construct
      clazz = self
      response = clazz.new('1.1', '200', 'OK')

      # inject
      response.instance_variable_set :@body, body

      # mockulate
      response.instance_eval 'def body; @body.to_json; end'

      response
    end
  end
end
# rubocop:enable Style/EvalWithLocation
