require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
    # This allows the app code to refresh
    # without having to restart the server.

    get '/hello' do #Phase 2 Chapter 2 Exercise 1
        name = params[:name]
        return "Hello #{name}"
    end

    post '/submit' do #Phase 2 Chapter 2 Challenge 1
        name = params[:name]
        message = params[:message]
        return "Thanks #{name}, you sent this message: " + '"' + "#{message}" + + '"'
    end

    get '/names' do #Phase 2 Chapter 3 Exercise 1
        return "Julia, Mary, Karim"
    end

    configure :development do
        register Sinatra::Reloader
    end

end