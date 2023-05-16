namespace :rubra do
  task :web do
    system "ruby app.rb -p 3000 -s puma"
  end

  task :app do
    system "npm start"
  end
end