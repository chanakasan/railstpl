run "echo 'Hello Rails 7'"

#gsub_file 'Gemfile', 'gem "tzinfo-data", platforms: %i[ mingw', 'gem "tzinfo-data", platforms: %i[ mri mingw'

run "bundle install"

git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }

#-------------------------------
# compose with other templates
#-------------------------------
rails_command "app:template LOCATION=~/railstpl/r7/gen.rb"
rails_command "app:template LOCATION=~/railstpl/r7/home.rb"
rails_command "app:template LOCATION=~/railstpl/r7/live.rb"
rails_command "app:template LOCATION=~/railstpl/r7/tail.rb"
