require_relative './helpers'

def main
  start_and_validate
  copy_files
  install_gems
  run_generators
  finish_and_commit
end

def start_and_validate
end

def finish_and_commit
end

# def run_generators
#   rails_command "generate devise:install"
#   model_name = ask("What do you want to call your Devise model?")
#   # We don't use rails_command here to avoid accidentally having RAILS_ENV=development as an attribute
#   run "rails generate devise #{model_name}"
# end

# def install_gems
#   run "bundle add devise"
#   do_bundle
# end

main