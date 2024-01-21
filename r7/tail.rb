# Install tailwind
#

#""""""""""""""""""""""""""""""""""""""""""""""""""""
# create files
#""""""""""""""""""""""""""""""""""""""""""""""""""""
file "tailwind.config.js", <<-STR
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    // './public/*.html',
    // './app/helpers/**/*.rb',
    // './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/aspect-ratio'),
    // require('@tailwindcss/typography'),
    // require('@tailwindcss/container-queries'),
  ]
} 
STR

file "app/assets/stylesheets/application.tailwind.css", <<-STR
@tailwind base;
@tailwind components;
@tailwind utilities;
  
STR

file "bin/nex", <<-STR
#!/usr/bin/env bash

rescue() {
  echo "Error: for command '$cmd'"
  exit 1
}

main() {
  local cmd="$1"
  $cmd.sh
}

main "$@"

STR

file "bin/dev.sh", <<-STR
overmind s -f Procfile.dev

STR


file "Procfile.dev", <<-STR
web: bin/rails server -p 3000
css: npx tailwindcss -w -i app/assets/stylesheets/application.tailwind.css -o app/assets/builds/tailwind.css -c tailwind.config.js
STR


#""""""""""""""""""""""""""""""""""""""""""""""""""""
# update files
#""""""""""""""""""""""""""""""""""""""""""""""""""""
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
  <h1 class="text-4xl font-bold mb-2 underline">Hello!</h1>
  
STR
  str
end

#""""""""""""""""""""""""""""""""""""""""""""""""""""
# finish up
#""""""""""""""""""""""""""""""""""""""""""""""""""""
run "chmod +x bin/*"
run "yarn add tailwindcss"

git add: "."
git commit: "-m 'install tailwindcss'"
