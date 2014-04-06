json.deposits @deposits do |deposit|
  json.type 'deposit'
  json.timestamp deposit.created_at
  if deposit.currency_obj.coin?
    json.coin_amount deposit.amount
    json.coin_currency deposit.currency
  else
    json.fiat_amount deposit.amount
    json.fiat_currency deposit.currency
  end
  json.coin_price ''
  json.fee deposit.fee
end

json.withdraws @withdraws do |withdraw|
  json.type 'withdraw'
  json.timestamp withdraw.created_at
  if withdraw.coin?
    json.coin_amount withdraw.amount
    json.coin_currency withdraw.currency
  else
    json.fiat_amount withdraw.amount
    json.fiat_currency withdraw.currency
  end
  json.coin_price ''
  json.fee withdraw.fee
end

json.buys @buys do |buy|
  json.type 'buy'
  json.timestamp buy.created_at
  json.fiat_currency buy.market.price_unit
  json.fiat_amount buy.volume * buy.price
  json.coin_currency buy.market.target_unit
  json.coin_amount buy.volume
  json.coin_price buy.price
end

json.sells @sells do |sell|
  json.type 'sell'
  json.timestamp sell.created_at
  json.fiat_currency sell.market.price_unit
  json.fiat_amount sell.volume * sell.price
  json.coin_currency sell.market.target_unit
  json.coin_amount sell.volume
  json.coin_price sell.price
end