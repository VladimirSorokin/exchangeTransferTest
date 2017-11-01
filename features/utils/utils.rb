require 'oj'

class Utils
  def initialize
    json_config = Oj.load_file('features/config', Oj.default_options)
    @config = json_config
  end

  def verified_response(resp, fee=@config['FEE'].to_i)
    resp.each_value do |value|
      if value.to_s.length <= 0
        raise 'Null in response value!'
      end
    end

    calcualted_fee = resp['debit_amount']/100*fee
    if resp['fee'] != calcualted_fee.round(4)
      raise 'Fee is incorrect in response'
    end

  end

  def verified_balanse(balance_before, balance_after, amount, type)
    case type
      when 'from_account'
        calcualted_balance_diff = balance_before - balance_after
        if calcualted_balance_diff.round(4) != amount.to_f
          raise 'Balanse in from_account after transfer is incorrect!'
        end
      when 'to_account'
        calcualted_balance_diff = balance_after - balance_before
        if calcualted_balance_diff.round(4) != amount
          raise 'Balanse to_account after transfer is incorrect!'
        end
      else
        raise 'Unsupported type!'
    end
  end

end