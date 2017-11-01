require 'oj'
require 'typhoeus'

class USD_account
  def initialize
    json_config = Oj.load_file('features/config', Oj.default_options)
    @config = json_config
    @uuid = @config['USD']
  end

  def send_to_account(account, amount)
    # uri = URI.parse(@config['URL'])
    # header = {'Content-Type': 'application/x-www-form-urlencoded', 'X-Api-Key': @config['API_KEY']}
    res = Typhoeus::Request.post(@config['URL'],
                                 body: {'amount': amount, 'amount_currency': 'USD', 'from_account':@uuid, 'to_account':account},
                                 :headers=>{'Content-type'=>'application/x-www-form-urlencoded', 'X-Api-Key'=>@config['API_KEY']})
    puts res.body
  end

  def get_balance
    res = Typhoeus::Request.get(@config['URL_A'], :headers=>{'Content-type'=>'application/json', 'X-Api-Key'=>@config['API_KEY']})
    for value in Oj.load(res.body, Oj.default_options)
      puts 'Check value!'
      if value['currency'] == 'USD'
        puts value['balance']
        return value['balance']
      end
    end
  end

  def get_uuid
    @config['USD']
  end


end