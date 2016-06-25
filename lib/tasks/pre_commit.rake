namespace :pre_commit do
  desc "Run test suite"
  task :ci do
    Rake::Task["default"].invoke
  end
end
