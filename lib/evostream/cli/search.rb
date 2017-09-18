# frozen_string_literal: true

# :reek:Nilcheck

module Evostream
  module CLI
    # Search data in evostream result
    class Search
      def initialize(yaml_search)
        @response = nil
        YAML.load(yaml_search).each do |key, value|
          @search = [key.to_sym, value]
        end
      end

      def search_node(result)
        YAML.load(result.to_yaml).each do |_key, value|
          inspect_array(value) if value.is_a?(Array) && !value.empty?
        end

        puts @response.nil? ? "No node equal to #{@search}" : @response
      end

      private

      def inspect_array(evostream_response)
        evostream_response.each do |value|
          inspect_hash(value)
        end
      end

      def inspect_hash(evostream_response)
        evostream_response.each do |hash_value|
          puts value.to_yaml if hash_value == @search
        end
      end
    end
  end
end