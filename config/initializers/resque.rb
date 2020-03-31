# frozen_string_literal: true

if Rails.env.development?
  Resque.redis = Redis.new(host: "localhost", port: 6379, password: ENV["REDIS_PASS"])
elsif Rails.env.test?
  Resque.redis = Redis.new(host: "localhost", port: 6379, password: ENV["REDIS_PASS"])
else
  Resque.redis = Redis.new(url: ENV["REDIS_URL"])
end

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
