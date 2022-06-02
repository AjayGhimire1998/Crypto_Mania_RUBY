require 'pastel'
require 'tty-progressbar'

module FancyText 
    module InstanceMethods
        def type_writter string
            pastel = Pastel.new
            string.each_char do |c|
                print pastel.cyan.bold c
                time_slot = rand(0.009..0.06)
                sleep(time_slot)
            end
        end

        def slow_motion number 
            number.to_s.each_char do |c|
                print c
                time_slot = rand(1..2)
                sleep(time_slot)
            end
        end

        def progressbar(bar_text, success_message)
            pastel = Pastel.new
            bar = 
            TTY::ProgressBar.new(pastel.cyan.bold(bar_text),
                width: 50)

            150.times do |i|
                sleep(0.05)
                bar.advance
                bar.update(total: 150) if i == 69          
            end
            
            puts pastel.cyan.bold(
                success_message)
        end

        def welcome_to_time_message(date, some_text)
            d = Date.strptime(date.split("-").join(""), '%d%m%Y')
            day = d.strftime('%A')
    
            type_writter("
    
                Alright....what a lovely #{day} to #{some_text}
                some investments.")
        end
    end
end