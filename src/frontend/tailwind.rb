# script: tailwind
source_paths << File.expand_path(__dir__)

copy_file "tailwind/tailwind.config.js", "tailwind.config.js"
copy_file "tailwind/application_tailwind.css", "app/assets/stylesheets/application_tailwind.css"
copy_file "tailwind/dev.sh", "bin/dev"
copy_file "tailwind/Procfile.local", "Procfile.local"

insert_into_file "app/assets/config/manifest.js" do
  str = <<STR
//= link_tree ../builds
STR
  str
end

insert_into_file ".gitignore" do
  str = <<STR

# for tailwind
/app/assets/builds/*
!/app/assets/builds/.keep
STR
  str
end

insert_into_file "app/views/layouts/application.html.erb", after: "<%= csp_meta_tag %>\n" do
  str = <<STR

    <%= stylesheet_link_tag "tailwind", "data-turbo-track": "reload" %>
STR
  str
end

insert_into_file "app/views/layouts/application.html.erb", before: "<%= yield %>\n" do
  str = <<STR
  <h1 class="text-4xl font-bold mb-2 underline">Hello Tailwind !</h1>
STR
  str
end


run "chmod +x bin/*"
run "yarn add tailwindcss"

git add: "."
git commit: %Q{-m "install tailwindcss"}
