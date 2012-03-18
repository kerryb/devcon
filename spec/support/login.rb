def fake_login
  controller.stub logged_in?: true
end
