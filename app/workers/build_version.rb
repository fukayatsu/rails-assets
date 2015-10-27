class BuildVersion
  include SuckerPunch::Job

  def perform(bower_name, version)
    return if FailedJob.exists?(name: "#{bower_name}##{version}")

    Build::Converter.run!(bower_name, version)
  end
end
