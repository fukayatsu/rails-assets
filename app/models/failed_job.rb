class FailedJob < ActiveRecord::Base
  serialize :args, Array

  def retry!
    klass.constantize.new.async.perform(args)
  end
end
