require 'sparql/client'

LOG_SPARQL_ALL = ENV.has_key?("LOG_SPARQL_ALL") ? ENV["LOG_SPARQL_ALL"].casecmp('true').zero? : true
LOG_SPARQL_QUERIES = ENV.has_key?("LOG_SPARQL_QUERIES") ? ENV["LOG_SPARQL_QUERIES"].casecmp('true').zero? : LOG_SPARQL_ALL
LOG_SPARQL_UPDATES = ENV.has_key?("LOG_SPARQL_UPDATES")? ENV["LOG_SPARQL_UPDATES"].casecmp('true').zero? : LOG_SPARQL_ALL

module Mu
  module AuthSudo
    module Helpers
      def self.included(base)
        define_method(:query_sudo) { |query| Mu::AuthSudo.query(query) }
        define_method(:update_sudo) { |query| Mu::AuthSudo.update(query) }
      end
    end

    def self.sparql_client(options = {})
      options = { headers: { 'mu-auth-sudo': 'true' } }
      if ENV['MU_SPARQL_TIMEOUT']
        options[:read_timeout] = ENV['MU_SPARQL_TIMEOUT'].to_i
      end
      SPARQL::Client.new(ENV['MU_SPARQL_ENDPOINT'], **options)
    end

    def self.query(query)
      if LOG_SPARQL_QUERIES
        puts "Executing sudo query: #{query}"
      end
      sparql_client.query query
    end

    def self.update(query)
      if LOG_SPARQL_UPDATES
        puts "Executing sudo update: #{query}"
      end
      sparql_client.update query
    end
  end
end

