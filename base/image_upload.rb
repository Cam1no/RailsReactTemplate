run 'bundle exec rails active_storage:install'

run 'bundle exec rails db:migrate'

file '.env.template', <<~CODE
  AWS_ACCESS_KEY='*************'
  AWS_SECRET_ACCESS_KEY='*************'
  AWS_BUCKET='*************'
  AWS_REGION='*************'
CODE

file 'app/models/concerns/image_helper.rb', <<~CODE
  module ImageHelper
    extend ActiveSupport::Concern

    included do
      has_many_attached :images
      scope :with_eager_loaded_image, -> { eager_load(images_attachments: :blob) }
      scope :with_preloaded_image, -> { preload(images_attachments: :blob) }
      scope :with_included_image, -> { includes(images_attachments: :blob) }
    end

    def service_urls
      images.map(&:service_url)
    end
  end
CODE

insert_into_file 'config/environments/production.rb', <<RUBY, after: 'Rails.application.configure do'

  config.active_storage.service = :amazon
RUBY

insert_into_file 'config/environments/development.rb', <<RUBY, after: 'Rails.application.configure do'

  config.active_storage.service = :amazon
RUBY

append_file 'config/storage.yml', <<YML
amazon:
  service: S3
  access_key_id: <%= ENV['AWS_ACCESS_KEY'] %>
  secret_access_key: <%= ENV['AWS_SECRET_ACCESS_KEY'] %>
  region: <%= ENV['AWS_REGION'] %>
  bucket: <%= ENV['AWS_BUCKET'] %>
YML

git add: '.'

git commit: %( -m 'setting image upload' )
