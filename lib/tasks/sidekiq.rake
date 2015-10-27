namespace :sucker_punch do
  desc "Schedule UpdateScheduler job"
  task :update => :environment do
    UpdateScheduler.new.async.perform
  end

  desc "Schedule Reindex job"
  task :reindex => :environment  do
    Reindex.new.async.perform
  end
end
