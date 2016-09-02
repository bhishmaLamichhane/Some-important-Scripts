# CURRENCIES = %w(USD JPY BGN CZK DKK GBP HUF ILS PLN RON SEK CHF NOK HRK RUB TRY AUD BRL CAD CNY HKD IDR INR KRW MXN MYR NZD PHP SGD THB ZAR).map(&:freeze).freeze

eu_bank = EuCentralBank.new
Money.default_bank = eu_bank
money1 = Money.new(10)
money1.bank # eu_bank

# call this before calculating exchange rates
# this will download the rates from ECB
eu_bank.update_rates

# exchange 100 CAD to USD
# API is the same as the money gem
eu_bank.exchange(100, "CAD", "USD") # Money.new(80, "USD")
Money.us_dollar(100).exchange_to("CAD")  # Money.new(124, "CAD")

# using the new exchange_with method
eu_bank.exchange_with(Money.new(100, "CAD"), "USD") # Money.new(80, "USD")
# for NRS
NRS = eu_bank.exchange(100, "CAD", "INR").fractional*1.6


# For performance reasons, you may prefer to read from a file instead. Furthermore, ECB publishes their rates daily. It makes sense to save the rates in a file to read from. It also adds an update_at field so that you can manage the update.

# cached location
cache = "/some/file/location/exchange_rates.xml"

# saves the rates in a specified location
eu_bank.save_rates(cache)

# reads the rates from the specified location
eu_bank.update_rates(cache)

if !eu_bank.rates_updated_at || eu_bank.rates_updated_at < Time.now - 1.days
  eu_bank.save_rates(cache)
  eu_bank.update_rates(cache)
end

# exchange 100 CAD to USD as usual
eu_bank.exchange_with(Money.new(100, "CAD"), "USD") # Money.new(80, "USD")