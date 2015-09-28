module ConfigFilesRemotely
  module Bitbucket
    class Snippet
      class FilenameError < StandardError; end
      attr_reader :username, :snippet_id, :filename
      def initialize(username, snippet_id, filename)
        @username = username
        @snippet_id = snippet_id
        @filename = filename
      end


      def data
        HTTPWrapper.new(endpoint).body
      end

      def last_version
        HTTPWrapper.new(last_version_url).body
      end

      private

      def _data
        @_data ||= JSON.parse(data)
      end

      def last_version_url
        begin
          _data['files'][filename]['links']['self']['href']
        rescue
          fail FilenameError, "file doesn't exists: #{filename}. #{__FILE__}:#{__LINE__}"
        end
      end

      def endpoint
        "https://api.bitbucket.org/2.0/snippets/#{username}/#{snippet_id}"
      end
    end
  end
end
