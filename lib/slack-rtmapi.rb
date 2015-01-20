require_relative 'slack-rtmapi/client'
require_relative 'slack-rtmapi/version'

require 'json'
require 'net/http'

#
# SlackRTM
#
class SlackRTM
  attr_writer :client
  attr_accessor :data
  def self.get_url(options)
    if options[:token].nil?
      raise ArgumentError.new '#get_url needs a valid slack token'
    end

    url = options[:slack_api_url] || 'https://slack.com/api'
    req = Net::HTTP.post_form URI(url + '/rtm.start'), token: options[:token]
    body = JSON.parse req.body
    URI(body['url'])
  end

  def initialize(options)
    @token = options.fetch(:token)
    @api_url = options[:slack_api_url] || 'https://slack.com/api'
  end

  def start_rtm
    @data = SlackWebAPI.call(method: 'rtm.start', token: @token)
    @websocket_url = URI(@data['url'])
    client
  end

  def client
    @client ||= SlackRTM::Client.new websocket_url: @websocket_url
  end
end

#
# SlackWebAPI
#
module SlackWebAPI
  def self.call(options)
    options.fetch(:token)
    method = options.fetch(:method)
    fail unless method.match(/^[a-z]+\.[A-z]+$/)
    options.delete(:method)
    api_url = options[:slack_api_url] || 'https://slack.com/api'
    req = Net::HTTP.post_form URI(api_url + '/' + method), options
    JSON.parse req.body
  end
end
