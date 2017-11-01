require 'oj'
require 'typhoeus'

class BTCAccount
  def initialize
    json_config = Oj.load_file('features/config', Oj.default_options)
    @config = json_config
    @uuid = @config['BTC']
  end

  def send_to_account(account, amount)
    # uri = URI.parse(@config['URL'])
    # header = {'Content-Type': 'application/x-www-form-urlencoded', 'X-Api-Key': @config['API_KEY']}
    res = Typhoeus::Request.post(@config['URL'],
                                 body: {'amount': amount, 'amount_currency': 'BTC', 'from_account':@uuid, 'to_account':account},
                                 :headers=>{'Content-type'=>'application/x-www-form-urlencoded', 'X-Api-Key'=>@config['API_KEY']})
    puts res.body
  end

  def get_balance

  end

  def get_uuid
    @config['BTC']
  end

end