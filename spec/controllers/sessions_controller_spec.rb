require "spec_helper"

describe SessionsController do
  let(:session) { stub }
  let(:conference) { stub }
  before { subject.conference = conference }

  describe "#new" do
    before { CONFERENCE.stub new_session: session }

    it "renders the new template" do
      get :new
      response.should render_template :new
    end

    it "assigns a new session" do
      get :new
      assigns[:session].should == session
    end
  end

  describe "#create" do
    before { CONFERENCE.stub new_session: session, suggest_session: true }

    it "adds the session" do
      session_params = {"title" => "Foo"}
      CONFERENCE.stub(:new_session).with(session_params).and_return session
      CONFERENCE.should_receive(:suggest_session).with(session)
      post :create, session: session_params
    end

    context "when successful" do
      it "redirects to the home page" do
        post :create
        response.should redirect_to(:root)
      end
    end
  end
end
