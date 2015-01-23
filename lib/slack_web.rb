# encoding: utf-8

require 'json'
require 'net/http'

module SlackWeb
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
