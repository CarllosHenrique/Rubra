namespace :rubra do
  desc "Starts the application server and the client-side development server simultaneously using Concurrently."
  task :app do
    system "concurrently ruby app.rb -p 3000 -s puma npm start || true"
  end

  desc "Start the web server"
  task :web do
    system "ruby app.rb -p 3000 -s puma"
  end
    
end