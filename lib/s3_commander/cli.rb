require 'thor'
module S3Commander
    class CLI < Thor
        desc 'shake!', 'Shakes the world'
        def shake!
            say 'grrr'
        end
    end
end
