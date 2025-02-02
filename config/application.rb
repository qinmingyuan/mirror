require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    config.time_zone = 'Beijing'
    config.i18n.default_locale = :zh

    config.server_timing = true
    config.middleware.delete ActionDispatch::RequestId # 记录X-Request-Id（方便查看请求在群集中的哪台执行）

    config.active_record.encryption.support_unencrypted_data = true

    config.active_job.queue_adapter = :solid_queue
    config.solid_queue.connects_to = { database: { writing: :queue } }
  end
end

ENV['EDITOR'] = 'vi'
SETTING = Rails.application.credentials
