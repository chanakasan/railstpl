source_paths.unshift(File.dirname(__FILE__))

run "bundle add polaris_view_components"
rails_command "polaris_view_components:install"

directory "files/layouts/polaris", "app/views/layouts/polaris"
directory "files/shared/polaris", "app/views/shared/polaris"
directory "files/examples/polaris", "app/views/examples/polaris"

inject_into_class "app/controllers/application_controller.rb", "ApplicationController" do %Q{
  layout "polaris/app"

}
end

git add: "."
git commit: %Q{ -m "script: polaris" }
