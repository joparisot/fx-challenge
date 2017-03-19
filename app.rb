require_relative 'controller'
require_relative 'router'
require 'twilio-ruby'

# Twilio keys
account_sid = ''
auth_token = ''

# numbers to send and receive the text
number_hash = {}
number_hash[:from_number] = ''
number_hash[:to_number] = ''

# Currency Layer API key
currencylayer_key = ''

client = Twilio::REST::Client.new account_sid, auth_token

controller = Controller.new(client, currencylayer_key, number_hash)
router = Router.new(controller)

router.run
