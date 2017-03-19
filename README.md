# fx-challenge
This is a command line application which allows you to enter a base currency, target currencies and a date. The app will send the FX rate of this day in a text.

It uses the currencylayer API to get the FX rates and the Twilio API to send the texts.

Improvements to be made:
- Feature 2: convert any number given from a given base currency into given target currencies
- Feature 3: Return the best exchange rate (highest) and the corresponding date of the last seven days for a given base and a given target currency
- Format of the text

Config:
Gems:
You will need to install the Twilio-Ruby gem.

In app.rb, you will need to input:
- Your Twilio account_sid and authenticity token (lines 7 & 8)
- Your twilio number (from_number) and the number to which you want to send the text (to_number) (lines 12 & 13)
- Your currencylayer API key (line 16)

Warnings:
- When asked for the target currencies, you are able to select several currencies one after the other.
If you are done selecting currencies, press 0 to go to the next step (it is written but might be hidden given the number of currencies)
- The app will not tell you if have made a mistake in the inputs, make sure:
You enter the three letters of the currency you want in capital letters
You enter the date in the format YYYY-MM-DD

Lastly, if you wish to choose a base currency other than USD, you will have to have a paid currencylayer account.
