require_relative '../../utility/Crypto_Calculator.rb'
require_relative './player.rb'
require_relative "../../utility/FancyText.rb"
require 'pastel'

class CryptoList 

    include CryptoCalculator::InstanceMethods
    include FancyText::InstanceMethods

    @@crypto_list = [
        ["bitcoin", "BTC"],
        ["ethereum", "ETH"],
        ["binancecoin", "BNB"],
        ["cardano", "ADA"],
        ["ripple", "XRP"],
        ["loopring", "LRC"],
        ["dogecoin", "DOGE"],
        ["qtum", "QTM"],
        ["tron", "TRX"],
        ["litecoin", "LTC"],
        ["decentraland", "MANA"],
        ["bitcoin-gold", "BTG"],
        ["iota", "MIOTA"],
        ["stellar", "XLM"],
        ["monero", "XMR"]
    ]
    @@future_crypto_list = [
        ["bitcoin", "BTC"],
        ["ethereum", "ETH"],
        ["binancecoin", "BNB"],
        ["cardano", "ADA"],
        ["ripple", "XRP"],
        ["loopring", "LRC"],
        ["dogecoin", "DOGE"],
        ["qtum", "QTM"],
        ["tron", "TRX"],
        ["litecoin", "LTC"],
        ["decentraland", "MANA"],
        ["bitcoin-gold", "BTG"],
        ["iota", "MIOTA"],
        ["stellar", "XLM"],
        ["monero", "XMR"]
    ]
    attr_accessor :crypto_list, :future_crypto_list


    def initialize crypto_list=nil, future_crypto_list=nil
        @crypto_list = @@crypto_list
        @future_crypto_list = @@future_crypto_list
    end

    def set_player_crypto_list_on_past
        Player.all[0].past_crypto_list = @crypto_list
    end

    def set_player_crypto_list_on_future
        Player.all[0].exited_crypto_data = @future_crypto_list
    end

    def list_past_data
        get_rate(@crypto_list, Player.all[0].entry_date)
        set_player_crypto_list_on_past
        progressbar(
            "Fetching currencies and their rates [:bar]",
            "
            Successfully Fetched!!
            
            " 
        )

        pastel = Pastel.new
        @crypto_list.each.with_index(1) do |crypto, index|
            puts pastel.green.bold("
            #{index}. #{crypto[0].upcase}  -  #{crypto[1]}  -  #{crypto[2]} AUD
            ")     
        end
    end


    def list_future_data
        get_rate(@future_crypto_list, Player.all[0].exit_date)
        set_player_crypto_list_on_future
        progressbar(
            "Fetching currencies and their rates [:bar]",
            "
            Successfully Fetched!!
            
            " 
        )
        pastel = Pastel.new
        @future_crypto_list.each.with_index(1) do |crypto, index|
            puts pastel.green.bold("
            #{index}. #{crypto[0].upcase}  -  #{crypto[1]}  -  #{crypto[2]} AUD
            ")     
        end
    end

end


