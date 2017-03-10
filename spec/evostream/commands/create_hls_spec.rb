# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::CreateHLS do
  let(:command) { Evostream::Commands::CreateHLS.new(cmd) }

  context 'create_master_playlist' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'create_master_playlist' }

    include_examples 'command'
  end

  context 'playlist_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'playlist_name' }

    include_examples 'command'
  end

  context 'max_chunk_length' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'max_chunk_length' }

    include_examples 'command'
  end

  context 'chunk_base_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'chunk_base_name' }

    include_examples 'command'
  end

  context 'drm_type' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'drm_type' }

    include_examples 'command'
  end

  context 'aes_key_count', broken: true do
    let(:arg_value) { Faker::Number.between(1, 99) }
    let(:argument) { 'aes_key_count' }

    include_examples 'command'
  end

  context 'audio_only' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'audio_only' }

    include_examples 'command'
  end

  context 'hls_resume' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'hls_resume' }

    include_examples 'command'
  end

  context 'cleanup_on_close' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'cleanup_on_close' }

    include_examples 'command'
  end

  context 'use_byte_range' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'use_byte_range' }

    include_examples 'command'
  end

  context 'file_length' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'file_length' }

    include_examples 'command'
  end

  context 'use_system_time' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'use_system_time' }

    include_examples 'command'
  end

  context 'offset_time' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'offset_time' }

    include_examples 'command'
  end

  context 'start_offset' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'start_offset' }

    include_examples 'command'
  end
end
