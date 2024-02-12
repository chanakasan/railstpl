gem_group :development do
  gem "rails_live_reload"
end

run "bundle install"

git add: "Gemfile*"
git commit: "-m 'enable livereload'"
