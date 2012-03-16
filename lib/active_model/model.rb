module ActiveModel
  # Based on Rails 4's ActiveModel::Model
  module Model
    def self.included(base)
      base.class_eval do
        extend  ActiveModel::Naming
        include ActiveModel::Conversion
      end
    end

    def initialize(attributes={})
      attributes.each do |attr, value|
        public_send("#{attr}=", value) if respond_to?("#{attr}=")
      end
    end

    def persisted?
      false
    end

    def ==(other)
      other.class == self.class && other.attributes == attributes
    end
  end
end
