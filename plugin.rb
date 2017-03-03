module Onebox
  module Engine
    class TopcoderOnebox
      include Engine
      include Engine::JSON

      matches_regexp /^https?:\/\/www.topcoder(-dev)?\.com\/.+?$/
      def url
        match_groups = @url.match(/^https?:\/\/www\.(topcoder(-dev)?\.com)\/challenge-details\/(\d+)\/.*?/)
        doamin = match_groups[1]
        challenge_id = match_groups[3]
        "https://api.#{domain}/v3/challenges/?filter=id%3D#{challenge_id}"

      def data
        return @data if @data
        challenge = data.result.content[0]

        @data = {
          link: @url,
          name: challenge.name
        }
        
      end
    end
  end
end
