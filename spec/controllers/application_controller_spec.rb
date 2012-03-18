require "spec_helper"

describe ApplicationController do
  controller do
    def index
      render nothing: true
    end
  end

  context "when there isn't an EIN in the session" do
    it "stores the requested page in the session" do
      get :index
      session[:path].should == "/anonymous"
    end

    it "redirects to the login page" do
      get :index
      response.should redirect_to :login
    end
  end

  context "when there is an EIN in the session" do
    it "doesn't redirect" do
      session[:ein] = "802285285"
      get :index
      response.should_not be_redirect
    end
  end
end
