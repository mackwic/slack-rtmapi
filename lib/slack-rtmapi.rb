require_relative 'slack-rtmapi/client'
require_relative 'slack-rtmapi/version'

require 'json'
require 'net/http'

module SlackRTM

  def self.get_url(options)
    if options[:token].nil?
      raise ArgumentError.new "#get_url needs a valid slack token"
    end

    url = options[:slack_api_url] || 'https://slack.com/api'
    req = Net::HTTP.post_form URI(url + '/rtm.start'), token: options[:token]
    body = JSON.parse req.body
    URI(body['url'])
  end

end
