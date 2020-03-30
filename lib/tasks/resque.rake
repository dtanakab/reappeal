# frozen_string_literal: true

require "resque/tasks"
require "resque/scheduler/tasks"

namespace :resque do
  task setup: :environment do
    ENV["TERM_CHILD"] ||= "1"
    ENV["QUEUE"] ||= "*"
    require "resque"
  end
end
