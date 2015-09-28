require 'http'
module ConfigFilesRemotely
  module Bitbucket
    class HTTPWrapper
      # class HTTPFailure < StandardError; end
      attr_reader :url

      def initialize(url)
        @url = url
      end

      def request
        @request ||= HTTP.basic_auth(user: Bitbucket.username, pass: Bitbucket.password).get(url)
      end

      def body
        request.to_s
      end


      # def process_response
      #   response = request
      #   case response
      #   when Net::HTTPSuccess
      #     response
      #   else
      #     fail HTTPFailure
      #   end
      # end

    end
  end
end
