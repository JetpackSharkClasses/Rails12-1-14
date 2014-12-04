require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
  	get root_path
  	assert_template "static_pages/home"
  	assert_select "a[href=?]", help_path
  	assert_select "a[href=?]", root_path, count: 2
  end

  test "logo exists" do
  	get root_path
  	assert_select "a img[alt='Rails logo']"
  end
end
