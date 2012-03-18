module ActiveModel
  # Based on Rails 4's ActiveModel::Model
  module Model
    def self.included(base)
      base.class_eval do
        extend  ActiveModel::Naming
        extend ActiveModel::Translation
        include ActiveModel::Conversion

        # Creates individual accessors and attributes method
        def self.expose_attributes *attr_names
          attr_accessor *attr_names
          define_method :attributes do
            Hash[attr_names.map {|a| [a, send(a)]}]
          end
        end
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
