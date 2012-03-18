require "spec_helper"

describe LoginController do
  describe "#new" do
    it "assigns a new user" do
      user = stub
      User.stub new: user
      get :new
      assigns[:user].should == user
    end
  end

  describe "#create" do
    def do_create
      post :create, user: {ein: "802285285"}
    end

    it "stores the user's EIN in the session" do
      do_create
      session[:ein].should == "802285285"
    end

    context "when there isn't a path in the session" do
      it "redirects to the home page" do
        do_create
        response.should redirect_to :root
      end
    end

    context "when there is a path in the session" do
      before { session[:path] = "/foo" }

      it "redirects to the path" do
        do_create
        response.should redirect_to "/foo"
      end

      it "removes the path from the session" do
        do_create
        session[:path].should be_nil
      end
    end
  end

  describe "#destroy" do
    it "removes the user's EIN from the session" do
      get :destroy
      session[:ein].should be_nil
    end

    it "redirects to the login page" do
      get :destroy
      response.should redirect_to :login
    end
  end
end
