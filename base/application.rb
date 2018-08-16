application do
  %q{
    config.time_zone = 'Tokyo'
    I18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.active_record.schema_format = :sql
    config.generators do |g|
      g.orm :active_record
      g.template_engine :slim
      g.test_framework :rspec, :fixture => true
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
      g.view_specs false
      g.controller_specs true
      g.routing_specs false
      g.helper_specs false
      g.request_specs false
      g.stylesheets false
      g.javascripts false
      g.assets false
      g.helper false
    end
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir['#{config.root}/lib/**/']
  }
end

git add: '.'

git commit: %( -m 'setting application.rb' )
