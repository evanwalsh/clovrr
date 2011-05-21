namespace :app do
  task :install do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:seed'].invoke
    puts "Clovrr is now installed."
    puts "\nVisit your_site/admin to get started."
    puts "\nThe default login is:"
    puts "\n    Username: admin"
    puts "    Password: admin"
    puts "\nMake sure you change that."
    puts "Thanks for trying Clovrr out."
  end
  
  task :version do
    puts "1.0.beta1"
  end
end