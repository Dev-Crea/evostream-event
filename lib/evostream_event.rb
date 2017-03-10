# frozen_string_literal: true

require 'evostream/info'
require 'evostream/service'
require 'evostream/commands'
require 'evostream/events'

# Primary command to gem
module Evostream
  def self.send_command(cmd)
    uri = URI.parse(Evostream::Service.uri_in)
    http = Net::HTTP.new(uri.host, uri.port)
    http.request(Net::HTTP::Get.new("/#{cmd}"))
  end

  def self.logger(message)
    Rails.logger.debug "[#{Evostream::GEM_NAME}] #{message}"
  end

  # Endpoint to gem
  class Event
    EVENTS = Evostream::Events::Event.descendants

    def initialize(type, payload)
      @payload = payload
      @model = type.sub(/^(\w)/, &:capitalize)
    end

    def execute_action
      klass = "Evostream::Events::#{@model}".constantize
      Evostream.logger "Execute Action : #{klass}"
      execute_klass(klass).execute if EVENTS.include?(klass)
    end

    private

    def execute_klass(klass)
      name_flux = extract_name_flux
      Evostream.logger "Name Flux : #{name_flux}"
      case [klass]
      when [Evostream::Events::InStreamCreated]
        klass.new(name_flux)
      when [Evostream::Events::InStreamClosed]
        klass.new(name_flux)
      when [Evostream::Events::OutStreamCreated]
        klass.new(name_flux, @payload)
      end
    end

    def extract_name_flux
      @payload[:name].gsub(Evostream::Service.name, '')
    end
  end
end
