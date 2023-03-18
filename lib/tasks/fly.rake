# commands used to deploy a Rails application
namespace :fly do
  # BUILD step:
  #  - changes to the filesystem made here DO get deployed
  #  - NO access to secrets, volumes, databases
  #  - Failures here prevent deployment
  task :build do
    sh 'yarn install'
    sh 'bin/rake assets:precompile'
  end

  # RELEASE step:
  #  - changes to the filesystem made here are DISCARDED
  #  - full access to secrets, databases
  #  - failures here prevent deployment
  task :release do
    sh 'db:migrate'
    sh 'db:seed_fu'
  end

  # SERVER step:
  #  - changes to the filesystem made here are deployed
  #  - full access to secrets, databases
  #  - failures here result in VM being stated, shutdown, and rolled back
  #    to last successful deploy (if any).
  task :server do
    sh 'bin/rails server'
  end
end
