require 'httparty'
require 'json'

module CryptoCalculator
    module InstanceMethods
        def get_rate_from_api(asset_id_base, time)
            uri = "https://api.coingecko.com/api/v3/coins/#{asset_id_base.gsub(/^"+|"+$/, '')}/history?date=#{time.gsub(/^"+|"+$/, '')}&localization=false"
            res = HTTParty.get(uri)
            parsed_data = JSON.parse(res.body)
            parsed_data["market_data"]["current_price"]["aud"]
        end

        def get_rate(crypto_list, date)
            crypto_list.each do |crypto|
                rate= get_rate_from_api(crypto[0], date)
                crypto[2] = rate.to_f.round(3)
            end
        end
    end
end
