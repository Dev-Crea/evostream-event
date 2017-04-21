# frozen_string_literal: true

require 'active_support'
require 'evostream/event/info'
require 'evostream/event/service'
require 'evostream/event/commands'
require 'evostream/event/event'
require 'evostream/event/action'
require 'evostream/event/response/json'
require 'net/http'

# Primary command to gem
module Evostream
  def self.send_command(cmd)
    Evostream::Response::JSON.new(prepare_request(cmd)).message
  end

  def self.logger(message)
    Rails.logger.debug "[#{Evostream::GEM_NAME}] #{message}" if defined?(Rails)
  end

  def self.prepare_request(cmd)
    if Evostream::Service.environment.eql?(:test)
      Evostream.request_test
    else
      Evostream.request_real(URI.parse("#{Evostream::Service.uri_in}/#{cmd}"))
    end
  end

  class << self
    private_class_method

    def request_test
      Net::HTTPSuccess.new(1.0, 200, 'OK')
    end

    def request_real(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.request(Net::HTTP::Get.new(uri.request_uri))
    end
  end
end
