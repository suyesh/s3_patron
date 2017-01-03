require 'thor'

module Kewl
    class CLI < Thor
        desc 'shake! NAME', 'Shakes the world'
        def shake!(name, hello)
            say "'grrr' #{name}"
        end
    end
end
