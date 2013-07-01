require 'dogapi'
require_relative 'emitable_example'

module Bosh
  module Helpers
    class DataDogReporter
      def initialize(data_dog_client = Dogapi::Client.new('bfce5cce73b6d2424607223e556ff420'))
        @data_dog_client = data_dog_client
      end

      def report_on(example)
        emitable_example = EmitableExample.new(example)
        puts "Emiting: #{emitable_example.to_a.inspect}"
        data_dog_client.emit_point(*emitable_example)
      end

      private
      attr_reader :data_dog_client
    end
  end
end
