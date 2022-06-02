require 'tty-prompt'
require 'pastel'
require_relative "../../utility/FancyText.rb"
require_relative '../../utility/Crypto_Calculator.rb'
require_relative './crypto_list.rb'
require 'date'
require 'tty-font'

class Player 
    include FancyText::InstanceMethods
    include CryptoCalculator::InstanceMethods

    attr_accessor :name, :balance, :entry_date, :past_crypto_list, :crypto_invested, :exit_date, :exited_crypto_data, :total_balance
    @@all = []
    
    def initialize name="", balance = 10000, entry_date="", past_crypto_list=[], crypto_invested=[], exit_date="", exited_crypto_data = []
        @name = name 
        @balance = balance
        @entry_date = entry_date
        @past_crypto_list = past_crypto_list
        @crypto_invested = crypto_invested
        @exit_date = exit_date
        @exited_crypto_data = exited_crypto_data
        @total_balance = total_balance
        save
    end

    def save 
        @@all << self
    end

    def self.all 
        @@all
    end

    def name 
        prompt = TTY::Prompt.new
        @name = prompt.ask("
            Enter Your Player Name: ")
        @name
    end

    def hello_name
        type_writter("
            Hello, #{@name.upcase},
            Allow me to have the pleasure of choosing 
            the year for you actually...hehe

            Don't worry, you get to choose the month and day.

            ")    
    end

    def set_entry_date 
        hello_name
        pastel = Pastel.new
        prompt = TTY::Prompt.new

        random_year = rand(2018..2021)

        slow_motion(random_year)

        puts pastel.cyan.bold"

            The year selected is #{random_year}
            
            "

        entered_date = prompt.ask(
            " 
            Now, Please type any day in format DD-MM:") do |q|
            q.validate(/([0-2][0-9]|(3)[0-1])[-|\/](((0)[0-9])|((1)[0-2]))/, "Invalid Date Format. TRY AGAIN!" )
        end

        @entry_date = "#{entered_date}-#{random_year}"
    end

    def permission_to_past
        prompt = TTY::Prompt.new

        choices = {yes: 1, no: 2}
        permission = 
            prompt.select("
            Are You Sure You Want To Go Back To #{@entry_date}?", 
            choices)
        
        puts "\n"
        puts "\n"
        
        if permission == choices[:yes]
            progressbar("Travelling to The Past [:bar]", 
                "

            Successfully Travelled Back to #{@entry_date}!!")

            welcome_to_time_message(@entry_date, "make")
        else
            permission_to_past
        end  
    end



    def set_exit_date
        pastel = Pastel.new 
        prompt = TTY::Prompt.new

        @exit_date = prompt.ask("Please type any day after
            #{@entry_date} and before 31-12-2021
            in format DD-MM-YYYY: ") do |q|
            q.validate(/([0-2][0-9]|(3)[0-1])[-|\/](((0)[0-9])|((1)[0-2]))[-|\/]\d{4}/, "Invalid Date Format. TRY AGAIN!" )
        end

        puts "\n"
        puts "\n"

        progressbar("Travelling Back To The Future [:bar]", 
                "

            Successfully Travelled Ahead to #{@exit_date}!!")
        
            welcome_to_time_message(@exit_date, "check on")
    end

    def total_balance_message 
        pastel = Pastel.new
        type_writter("

            The 10,000 AUD you have invested  in #{@entry_date}
            has made the total balance of....

            ")
        slow_motion(pastel.green.bold("#{@total_balance} AUD"))
        type_writter("
            
            in #{@exit_date}.
            
            ")
    end

end

