env :MAILTO, nil

every 3.hours do
  runner "UpdateScheduler.new.async.perform"
end
