module SpreeHiddenProperties
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_hidden_properties'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
    
    initializer 'spree_hidden_properties.custom_permitted_params', after: 'spree.environment' do |app|
      Spree::Api::ApiHelpers.product_property_attributes << :hidden
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
