# frozen_string_literal: true

require 'active_support'
require 'evostream/event/info'
require 'evostream/event/service'
require 'evostream/event/commands'
require 'evostream/event/event'
require 'evostream/action/action'
require 'evostream/event/response/response'
require 'net/http'
require 'evostream/event/response/mock'

# :reek:NilCheck

# Primary command to gem
module Evostream
  def self.send_command(cmd, uri_in = nil)
    Evostream.logger "CMD : #{cmd}"
    Evostream::Responses.new(prepare_request(cmd, uri_in)).message
  end

  def self.logger(message)
    Rails.logger.debug "[#{Evostream::GEM_NAME}] #{message}" \
      if Evostream::Service.environment.eql?('development') && defined?(Rails)
  end

  def self.prepare_request(cmd, uri_in = nil)
    env = Evostream::Service.environment.to_sym
    Evostream.logger "ENV  ------> #{env}"
    case env
    when :test
      Evostream.request_test(cmd)
    when :development, :production
      prepare_request_real(uri_in.nil? ? Evostream::Service.uri_in : uri_in,
                           cmd)
    end
  end

  def self.prepare_request_real(url, cmd)
    Evostream.request_real(URI.parse("#{url}/#{cmd}"))
  end

  class << self
    private_class_method

    def request_test(command)
      json = JSON.parse(File.read(find_fixture(command)))
      Net::HTTPSuccess.mock(json)
    end

    def request_real(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.request(Net::HTTP::Get.new(uri.request_uri))
    end

    def path_fixture
      File.realpath(File.join(File.dirname(__FILE__), '..', '..', 'spec',
                              'support', 'fixtures'))
    end

    def find_fixture(command)
      File.join(path_fixture, "#{command.split('?')[0].underscore}.json")
    end
  end
end
