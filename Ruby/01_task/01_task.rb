EXCHANGE_RATE = {usd: 1.7408, eur: 1.9557, gbp: 2.6415, bgn: 1}

def convert_to_bgn(price, currency)
  (EXCHANGE_RATE[currency] * price).round(2)
end

def compare_prices(first_price, first_currency, second_price, second_currency)
  first_price_bgn  = convert_to_bgn(first_price, first_currency)
  second_price_bgn = convert_to_bgn(second_price, second_currency)

  first_price_bgn <=> second_price_bgn
end
