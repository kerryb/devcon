RSpec.configure do |config|
  config.mock_with :rr
end

def stub_active_model
  stub_module "ActiveModel::Naming"
  stub_module "ActiveModel::Translation"
  stub_module "ActiveModel::Validations"
  stub_module "ActiveModel::Conversion"
end

def stub_module full_name
  full_name.to_s.split(/::/).inject(Object) do |context, name|
    begin
      context.const_get(name)
    rescue NameError
      context.const_set(name, Module.new)
    end
  end
end
