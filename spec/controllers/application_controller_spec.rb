Skip to content
This repository
Search
Pull requests
Issues
Marketplace
Explore
 @ArielFeingold
Sign out
0
0 778 ArielFeingold/sinatra-user-auth-v-000
forked from learn-co-students/sinatra-user-auth-v-000
 Code  Pull requests 0  Projects 0  Wiki  Insights  Settings
sinatra-user-auth-v-000/spec/controllers/application_controller_spec.rb
b3aa3bd  on Jul 29, 2016
@gj gj matched homepage, sign-up, & login to their spelling in README
@vicfriedman @SophieDeBenedetto @gj

73 lines (56 sloc)  1.8 KB
require 'spec_helper'

describe "ApplicationController" do
  describe "homepage: GET /" do

    before(:each) do
      get '/'
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the homepage view, 'home.erb'" do
      expect(last_response.body).to include("Welcome to Hogwarts")
    end
  end

  describe "sign-up page: GET /registrations/signup" do

    before(:each) do
      get '/registrations/signup'
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the sign-up template" do
      expect(last_response.body).to include("Sign Up")
    end
  end

  describe "login page: GET /sessions/login" do

    before(:each) do
      get '/sessions/login'
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the sign-up template" do
      expect(last_response.body).to include("Log In")
    end
  end

  describe "user's homepage: GET /users/home" do

    it "responds with a 200 status code" do
      @user = User.create(:name => "Bitsy Flipsy", :email => "bitsy@hogwarts.edu", :password => "luminosity")
      visit 'sessions/login'
      fill_in(:email, :with => "bitsy@hogwarts.edu")
      fill_in(:password, :with => "luminosity")
      click_button "Log In"
      visit '/users/home'
      expect(page.status_code).to eq(200)
    end

    it "welcomes the user" do
      @user = User.create(:name => "Bitsy Flipsy", :email => "bitsy@hogwarts.edu", :password => "luminosity")
      visit 'sessions/login'
      fill_in(:email, :with => "bitsy@hogwarts.edu")
      fill_in(:password, :with => "luminosity")
      click_button "Log In"
      visit '/users/home'
      expect(page.body).to include("Welcome, #{@user.name}")
    end
  end

end
© 2018 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
API
Training
Shop
Blog
About
Press h to open a hovercard with more details.
