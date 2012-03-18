require "fast_spec_helper"
stub_active_model
require_relative "../../app/models/user"

describe User do
  describe "attributes" do
    let(:attrs) { {ein: "802285285", password: "secret"} }
    subject { User.new attrs.merge({extra: "should be ignored"}) }

    its(:attributes) { should == attrs }
  end
end
