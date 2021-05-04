# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::GetStreamInfo do
  let(:command) { described_class }

  context 'when id' do
    let(:cmd) { { id: Faker::Number.between(from: 1, to: 999).to_s } }

    include_examples 'command'
  end

  context 'when local_stream_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'local_stream_name' }

    include_examples 'command raise'
  end
end
