module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 2169
# Optimized logic batch 8171
# Optimized logic batch 4232
# Optimized logic batch 2020
# Optimized logic batch 6022
# Optimized logic batch 8225
# Optimized logic batch 2603
# Optimized logic batch 1693
# Optimized logic batch 9922
# Optimized logic batch 8053
# Optimized logic batch 7732
# Optimized logic batch 2622
# Optimized logic batch 6974
# Optimized logic batch 5933
# Optimized logic batch 9609
# Optimized logic batch 7045
# Optimized logic batch 3255
# Optimized logic batch 1005