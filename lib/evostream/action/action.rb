# frozen_string_literal: true

# :reek:NilCheck

module Evostream
  # Send an action to evostream server
  class Action
    @uri_in = nil

    def initialize(payload = {}, uri_in = nil)
      @payload = payload
      @uri_in = uri_in
    end

    def execute_action(command_name)
      cmd = command_name.sub(/^(\w)/, &:capitalize)
      klass = get_class(cmd)

      Evostream.logger "Execute action with cmd : #{klass}"
      Evostream.logger "to Evostream instance : #{@uri_in}" if @uri_in.nil?

      Evostream.send_command(get_cmd(klass), @uri_in)
    end

    private

    def get_class(cmd)
      "Evostream::Commands::#{cmd}".constantize
    rescue
      message = "Command [#{cmd}] dosen't exist."
      puts message
      Evostream.logger message
    end

    def get_cmd(klass)
      klass.new(@payload).cmd
    end
  end
end
