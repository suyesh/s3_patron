require 'thor'

module Kewl
    class CLI < Thor
        desc 'shake!', 'Shakes the world'
        def shake!(name, hello)
            say 'grrr'
        end
    end
end
