class UpdateScheduler
  include SuckerPunch::Job

  def perform
    Component.select(:id, :bower_name).find_each do |component|
      UpdateComponent.new.async.perform(component.bower_name)
    end
  end
end
