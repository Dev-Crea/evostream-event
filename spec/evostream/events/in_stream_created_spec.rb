# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Events::InStreamCreated, type: :request do
  let(:body) do
    {
      id: Faker::Number.between(from: 1, to: 999_999),
      payload: {
        PID: Faker::Number.between(from: 1, to: 999_999),
        appName: 'evostreamms',
        audio: {
          bytesCount: Faker::Number.between(from: 1, to: 999_999),
          codec: 'AAAC',
          codecNumeric: Faker::Number.between(from: 1, to: 999_999),
          droppedBytesCount: 0,
          droppedPacketsCount: 0,
          packetsCount: Faker::Number.between(from: 1, to: 999_999)
        },
        bandwidth: Faker::Number.between(from: 1, to: 999_999),
        connectionType: 0,
        creationTimestamp: Faker::Number.decimal(l_digits: 2),
        customData: nil,
        farIp: Faker::Internet.ip_v4_address,
        farPort: Faker::Number.between(from: 1, to: 65_536),
        ip: Faker::Internet.ip_v4_address,
        name: "#{Faker::Games::Zelda.character}_#{Faker::Number.between(from: 1, to: 999)}",
        nearIp: Faker::Internet.ip_v4_address,
        nearPort: Faker::Number.between(from: 1, to: 65_536),
        outStreamsUniqueIds: nil,
        port: Faker::Number.between(from: 1, to: 65_536),
        processId: Faker::Number.between(from: 1, to: 999),
        processType: 'origin',
        queryTimestamp: Faker::Number.decimal(l_digits: 3),
        type: 'INP',
        typeNumeric: Faker::Number.between(from: 1, to: 999_999_999),
        uniqueId: 2,
        upTime: Faker::Number.decimal(l_digits: 3),
        userAgent: 'Lavf56.40.101',
        video: {
          bytesCount: Faker::Number.between(from: 1, to: 999_999),
          codec: 'VH264',
          codecNumeric: Faker::Number.between(from: 1, to: 999_999_999),
          droppedBytesCount: 0,
          droppedPacketsCount: 0,
          height: Faker::Number.between(from: 1, to: 999),
          level: Faker::Number.between(from: 1, to: 999),
          packetsCount: Faker::Number.between(from: 1, to: 999),
          profile: Faker::Number.between(from: 1, to: 999),
          width: Faker::Number.between(from: 1, to: 999)
        }
      },
      processId: Faker::Number.between(from: 1, to: 999_999),
      timestamp: Faker::Number.between(from: 1, to: 999_999),
      type: 'inStreamCreated'
    }
  end

  let(:type_default) { 'inStreamCreated' }

  context 'when payload is correct' do
    let(:type) { body[:type] }
    let(:payload) { body[:payload] }

    include_examples 'payload is correct'
  end

  context 'when payload isn\'t correct' do
    let(:body) { Faker::Lorem.paragraph }
    let(:type) { Faker::Games::Zelda.character }
    let(:payload) { Faker::Games::Zelda.game }

    include_examples 'payload isn\'t correct'
  end
end
