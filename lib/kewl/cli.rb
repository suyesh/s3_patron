require 'thor'

module Kewl
    class CLI < Thor
        desc 'shake!', 'Shakes the world'
        def shake!
            say 'grrr'
        end
    end
end
