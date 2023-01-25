require 'sinatra'
require 'json'
set :bind, '0.0.0.0'

post '/payload' do
  puts "PAyload, #{request.body}"
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"

  workdir = "/root/porfolio-dev"
  Dir.chdir(workdir) do
    puts "Tirando docker compose"

    down_compose = "dc down"
    system down_compose
    puts "Rebaseando git"
    system "git pull --rebase"
    puts "Instalndo npm"
    system "npm run build"

    puts "Corriendo el build de docker."
    system "dc up --build"
    puts "Finished"
  end

end
