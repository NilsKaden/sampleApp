require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  
  def setup
    @user = users(:michael)
  end
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    
    # I feel like we shouldn't test for News, which is a link to an external site
    
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path
    
    # links for logged in users
    log_in_as(@user)
    follow_redirect!
    # users, profile, settings, log out
    # users leads to index, settings to edit and logout to destroy
    assert_select "a[href=?]", users_path
    # i dont know how to test for the specific method being called on users
    # so i will stop here and just say this test is     I N C O M P L E T E !
    assert_select "a[href=?]", logout_path
    
    

  end
end
