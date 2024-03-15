def add_to_commit(filename)
  git add: filename
end

def commit_changes(msg)
  git commit: %Q{ -m "#{msg}" }
end
