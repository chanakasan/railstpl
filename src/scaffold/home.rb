generate(:controller, "pages", "home")

inject_into_file "config/routes.rb", "root \"pages#home\"\n", :before => /^end/

git add: "."
git commit: "-m 'add home page'"
