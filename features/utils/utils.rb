class Utils
  def initialize
    json_config = Oj.load_file('features/config', Oj.default_options)
    @config = json_config
  end

  def verified_response(resp, fee=@config['FEE'])
    resp.each_value do |value|
      puts value
      if value.to_s.length <= 0
        raise 'Null in response value!'
      end
    end

    calcualted_fee = resp['debit_amount']/100*fee
    puts calcualted_fee
    if resp['fee'] != calcualted_fee.round(2)
      raise 'Fee is incorrect in response'
    end

    calculated_credit_amount =  (resp['debit_amount'] - resp['fee'])/resp['rate']
    puts calculated_credit_amount
    if calculated_credit_amount.round(4) != resp['credit_amount']
      raise 'Calculated credit is incorrect in response'
    end
  end

end