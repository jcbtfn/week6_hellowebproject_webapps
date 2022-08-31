require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
    # This allows the app code to refresh
    # without having to restart the server.

    get '/hello' do
        name = params[:name]
        return "Hello #{name}"
    end

    post '/submit' do
        name = params[:name]
        message = params[:message]
        return "Thanks #{name}, you sent this message: " + '"' + "#{message}" + + '"'
    end

    post '/sort-names1' do #Take 1 (1 only string joined with ,)
        p params[:names].split(",").sort.join(", ")
        return params[:names].split(",").sort.join(", ")
    end

    post '/sort-names2' do #Take 2 (a string of names)
        p params[:names2].split(/,\s*/).sort.join(", ")
        return params[:names2].split(/,\s*/).sort.join(", ")
    end

    post '/sort-names2b' do #Take 2 (a string of not common names - exoplanets)
        p params[:names2b].split(", ").sort.join(", ")
        return params[:names2b].split(", ").sort.join(", ")
    end

    post '/sort-names3' do #Take 3 (an array of names)
        #binding.irb
        p params[:names3].sort
        p params[:names3].sort.join(", ")
        return params[:names3].sort.join(", ")
    end

    configure :development do
        register Sinatra::Reloader
    end

end