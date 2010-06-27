require 'spec_helper'

describe "Layout links" do
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should render_template('pages/contact')
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should render_template('pages/about')
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should render_template('pages/help')
  end
  
  it "should have a Sign up page at '/signup'" do
    get '/signup'
    response.should render_template('users/new')
  end
  
  # For Webrat link test
  it "should have the right links on the layout" do
    visit root_path
    click_link "Home"
    response.should render_template('pages/home')
    click_link "Contact"
    response.should render_template('pages/contact')
    click_link "About"
    response.should render_template('pages/about')
    click_link "Help"
    response.should render_template('pages/help')
    visit root_path
    click_link "Sign up now!"
    response.should render_template('users/new')
  end
  
  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_tag("a[href=?]", signin_path, "Sign in")
    end
  end
  
  describe "when signed in" do
    before(:each) do
      @user = Factory(:user)
      integration_sign_in(@user)
    end
    
    it "should have a signout link" do
      visit '/'
      response.should have_tag("a[href=?]", signout_path, "Sign out")
    end
    
    it "should have a users link" do
      visit root_path
      response.should have_tag("a[href=?]", users_path, "Users")
    end
    
    it "should have a profile link" do
      visit root_path
      response.should have_tag("a[href=?]", user_path(@user), "Profile")
    end
    
    it "should have a settings link" do
      visit root_path
      response.should have_tag("a[href=?]", edit_user_path(@user), "Settings")
    end
  end
end