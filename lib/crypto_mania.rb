require_relative "../utility/FancyText.rb"
require 'tty-font'

class CryptoMania
    include FancyText::InstanceMethods

    def run
       welcome
       Player.new.name
       Player.all[0].set_entry_date
       Player.all[0].permission_to_past
       select_currencies_message
       CryptoList.new.list_past_data
       InvestedCrypto.select_crypto_to_invest
       InvestedCrypto.show_investments
       InvestedCrypto.add_to_player
       waiting_message
       Player.all[0].set_exit_date
       lets_check_on_rates_message
       CryptoList.new.list_future_data
       InvestedCrypto.set_exit_rate
       excited_message
       InvestedCrypto.set_and_show_total_amount
       Player.all[0].total_balance_message
       win_message
    end


    def welcome 
        pastel = Pastel.new
        puts pastel.red.on_white.bold"
            ==============================
            WELCOME TO THE CRYPTOMANIA
            ==============================
            "
        type_writter("
            Everyone wants to know about the future and travel 
            ahead of time.
            Its genuine, no one wants to to think about the
            past and bother themselves worrying about something
            that cannot be changed. 
            ")
        type_writter("
            But this time, lets take a moment to go back to the
            past and play a simulation game where in the end, 
            you could be either super-rich or not.
            ")
        type_writter("
            You are going to the past, any day between 2018 to 2021.

            At the start of the game, you will be given 10,000 AUD.
            And you will be given a list of Crypto Currencies you 
            can choose to invest on. You can choose as many currencies 
            you like to invest. 

            After that, you can skip to any day in the future between
            the day you chose at first to be on and last day of 2021.

            Then, all the total earnings you have made throughout
            the time through those cryptos you have invested are
            calculated and if you become able to double or more your 
            initial 10,000 AUD, YOU WIN !!

            But, sadly......You are not allowed to withdraw that
            money to your account 🤭, but hey....DON'T WORRY.
            It all will be donated to charities all over the 
            world for good causes. 😇 

            OK, Lets Start.....


            ")
    end

    def select_currencies_message 
        type_writter("
            
            Now its time to choose cryptos 
            you want to invest on....
            Please, be mindful, you only have 10,000 AUD
            to change the world with good causes.

            We all are counting on you.... 🥺

            Below is a list of 15 top cryptocurrencies 
            of the time and their respective rates in AUD. 


            ")
    end

    def waiting_message 
        sleep(2)
        type_writter("
            
            Phewwww....That was a heck of a thing we did.
            
            Now, we play WAITING GAME.......

            WAITING.....

            ....

            WAITING....
            
            ....
            
            Oh WAIT!!
            
            Did you forget we are in past time-line inside
            a simulation game ??
            
            We were allowed to time travel to the past,
            then don't worry, we can also
            time travel to the FUTURE...

            So, lets cut off all the waiting game 
            and see how much money our investments 
            made, SHALL WE??


            ")
    end

    def lets_check_on_rates_message 
        type_writter("
            
            Below is the list of those 15 coins
            from the past and their present rates.
            
            ")
    end

    def excited_message 
        sleep(2)
        type_writter("
            
            WOOOOOOAHHHHH....looks like a lot has
            changed 🧐🧐.
            
            You sit tight, while the calculations are
            being carried out.
            
            ")
        progressbar("Calculating the profits [:bar]", 
            "

        Calculations Successfull!!
        
            ")
    end

    def win_message 
        font = TTY::Font.new(:starwars)
        pastel = Pastel.new

        if Player.all[0].total_balance > 20000
            puts pastel.green.bold(font.write("  YOU WIN!  "))
        else
            puts pastel.red.bold(font.write("  YOU LOSE!  ")) 
        end
    end
end