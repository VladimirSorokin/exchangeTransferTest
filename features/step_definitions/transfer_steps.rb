Then(/^Transfer from "([^"]*)" account to "([^"]*)" account. Amount "([^"]*)"$/) do |arg1, arg2, arg3|
  verifier = Utils.new

  case arg1
    when 'BTC'
      from_account = BTCAccount.new
    when 'USD'
      from_account = USD_account.new
    else
      raise('Unspported account name!')
  end

  case arg2
    when 'BTC'
      to_account = BTCAccount.new
    when 'USD'
      to_account = USD_account.new
    else
      raise('Unspported account name!')
  end

  balanse_before_from_account = from_account.get_balance
  balanse_before_to_account = to_account.get_balance
  
  resp = from_account.send_to_account(to_account.get_uuid, arg3)
  verifier.verified_response(resp)
  
  balanse_after_from_account = from_account.get_balance
  balanse_after_to_account = to_account.get_balance
  verifier.verified_balanse(balanse_before_from_account, balanse_after_from_account, arg3, 'from_account')
  verifier.verified_balanse(balanse_before_to_account, balanse_after_to_account, resp['credit_amount'], 'to_account')
end