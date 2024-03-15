source_paths.unshift(File.dirname(__FILE__))

directory "files/layouts/polaris", "app/views/layouts/polaris"
directory "files/shared/polaris", "app/views/shared/polaris"
directory "files/examples/polaris", "app/views/examples/polaris"

run "bundle add polaris_view_components"
rails_command "polaris_view_components:install"

git add: "."
git commit: %Q{ -m "script: polaris" }
