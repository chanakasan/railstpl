source_paths.unshift(File.dirname(__FILE__))

def run_main
  create_first_commit
  apply "home.rb"

  apply_template "install/home"
  apply_template "install/live_reload"
  apply_template "install/polaris"
end

def create_first_commit
  git add: "."
  git commit: %Q{ -m "first commit" }
end

def apply_template(name)
  base="~/railstpl/src"
  file="#{name}/main.rb"
  rails_command "app:template LOCATION=#{base}/#{file}"
end

after_bundle do
  run_main
end
