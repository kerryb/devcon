require "spec_helper"

describe ApplicationHelper do
  describe ".insert_line_breaks" do
    it "replaces line endings with <br /> tags" do
      text = "foo\nbar\rbaz\r\nquz"
      helper.insert_line_breaks(text).should == "foo<br />bar<br />baz<br />quz"
    end

    it "escapes HTML" do
      helper.insert_line_breaks("foo<p>\nbar").should == "foo&lt;p&gt;<br />bar"
    end

    it "is HTML-safe" do
      helper.insert_line_breaks("foo").should be_html_safe
    end
  end
end
