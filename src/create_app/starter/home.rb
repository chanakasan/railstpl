generate(:controller, "pages", "home")

inject_into_file "config/routes.rb", before: /^end/ do
  %Q{  root "pages#home"\n}
end

git add: "."
git commit: %Q{ -m "script: home" }
