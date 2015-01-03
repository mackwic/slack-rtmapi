slack-rtmapi
============

All you need to use the RTM api of Slack

Please note that this gem is GPLv3. You *CAN'T* use it for proprietary software.
If you need a licence, please contact me and I will respond within the 24 hours.

HOW TO USE
----------

First, install the gem: `gem install slack-rtmapi`.

```ruby
require 'slack-rtmapi'

url = SlackRTM.get_url token: 'xxx' # get one on https://api.slack.com/web#basics
client = SlackRTM::Client.new websocket_url: url

client.on :message {|data| p data}
client.send {type: 'hello'}

client.main_loop
assert false # never ending loop
```
Slack-rtmapi is very hackable and configurable. More documentation will come soon (especially Rails integration), with helpers for integrations with the usual engines (EventMachine and Rack are planned, maybe Celluloid).  
Stay tuned and follow the ongoing [_Dead Simple_ serie](https://github.com/mackwic/slack-rtmapi/wiki) on the wiki !

As always, pull request welcome, we are very contributor friendly.

For more informations about the Slack Real Time API, please check https://api.slack.com/rtm

