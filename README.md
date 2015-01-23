slack-rtmapi
============
[![Code Climate](https://codeclimate.com/github/mackwic/slack-rtmapi/badges/gpa.svg)](https://codeclimate.com/github/mackwic/slack-rtmapi)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/mackwic/slack-rtmapi?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

All you need to use the RTM api of Slack

Please note that this gem is GPLv3. You *CAN'T* use it for proprietary software.
If you need a licence, please contact me and I will respond within the 24 hours.

HOW TO USE
----------

First, install the gem: `gem install slack-rtmapi`.

```ruby
# require_relative 'slack-rtmapi'
require_relative '/usr/local/slack-rtmapi/lib/slack-rtmapi'

token = 'xxx'
channel_id = 'id'

url = SlackRTM.get_url token: token # get one on https://api.slack.com/web#basics
client = SlackRTM::Client.new websocket_url: url

client.on(:message)  { |data| p data }
client.send channel: channel_id, type: 'message', text: 'Hi there'

client.main_loop
assert false # never ending loop
```

Slack-rtmapi is very hackable and configurable. More documentation will come soon (especially Rails integration), with helpers for integrations with the usual engines (EventMachine and Rack are planned, maybe Celluloid).  
Stay tuned and follow the ongoing [_Dead Simple_ serie](https://github.com/mackwic/slack-rtmapi/wiki) on the wiki !

As always, pull request welcome, we are very contributor friendly.

For more informations about the Slack Real Time API, please check https://api.slack.com/rtm

Contributors
------------
- [mackwic](https://github.com/mackwic)
- [zipkid](https://github.com/zipkid)
