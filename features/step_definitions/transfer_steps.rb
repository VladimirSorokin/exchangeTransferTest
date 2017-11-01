Then(/^Transfer from "([^"]*)" account to "([^"]*)" account. Amount "([^"]*)"$/) do |arg1, arg2, arg3|
  verifier = Utils.new

  case arg1
    when 'BTC'
      from_account = BTCAccount.new
    when 'USD'
      from_account = USD_account.new
    when 'EUR'
      from_account = BTCAccount.new
    when 'GBP'
      from_account = BTCAccount.new
    else
      raise('Unspported account name!')
  end

  case arg2
    when 'BTC'
      to_account = BTCAccount.new
    when 'USD'
      to_account = USD_account.new
    when 'EUR'
      to_account = BTCAccount.new
    when 'GBP'
      to_account = BTCAccount.new
    else
      raise('Unspported account name!')
  end

  resp = from_account.send_to_account(to_account.get_uuid, arg3)
  verifier.verified_response(resp)
end