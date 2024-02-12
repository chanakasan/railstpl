run "yarn add tailwindcss"
run "mkdir app/javascript/css"
run "touch app/javascript/css/application.scss"

inject_into_file 'app/javascript/css/application.scss' do <<~EOF
  @import "tailwindcss/base";
  @import "tailwindcss/components";
  @import "tailwindcss/utilities";
  EOF
end

inject_into_file 'app/javascript/packs/application.js' do <<~EOF
  require("css/application.scss")
  EOF
end

inject_into_file 'postcss.config.js', before: "require('postcss-import')" do <<~EOF
  require('tailwindcss'),
  require('autoprefixer'),
  EOF
end

inject_into_file 'app/views/layouts/application.html.erb', before: '</head>' do <<~EOF
  <%= stylesheet_pack_tag 'stylesheets', media: 'all', 'data-turbolinks-track': 'reload' %>
  EOF
end