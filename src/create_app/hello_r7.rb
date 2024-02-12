run "echo 'Hello Rails 7'"
run "bundle install"

git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }

# compose with other templates
rails_command "app:template LOCATION=~/railstpl/config/gen.rb"
rails_command "app:template LOCATION=~/railstpl/scaffold/home.rb"
rails_command "app:template LOCATION=~/railstpl/dx/live_reload.rb"
rails_command "app:template LOCATION=~/railstpl/frontend/tailwind.rb"
