# frozen_string_literal: true

module ActiveJob
  # Raised when an exception is raised during job arguments deserialization.
  #
  # Wraps the original exception raised as +cause+.
  class DeserializationError < StandardError
    def initialize # :nodoc:
      super("Error while trying to deserialize arguments: #{$!.message}")
      set_backtrace $!.backtrace
    end
  end

  # Raised when an unsupported argument type is set as a job argument. We
  # currently support String, Integer, Float, NilClass, TrueClass, FalseClass,
  # BigDecimal, Symbol, Date, Time, DateTime, ActiveSupport::TimeWithZone,
  # ActiveSupport::Duration, Hash, ActiveSupport::HashWithIndifferentAccess,
  # Array, Range, or GlobalID::Identification instances, although this can be
  # extended by adding custom serializers.
  # Raised if you set the key for a Hash something else than a string or
  # a symbol. Also raised when trying to serialize an object which can't be
  # identified with a GlobalID - such as an unpersisted Active Record model.
  class SerializationError < ArgumentError
  end

  # Can be raised by adapters if they wish to communicate to the caller a reason
  # why the adapter was unexpectedly unable to enqueue a job.
  class EnqueueError < StandardError
  end
end
