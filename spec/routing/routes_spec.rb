require 'spec_helper'
  require 'rails_helper'
  describe "Routes" do
    describe "PostsController" do
      it "routes to posts index" do
        expect(:get => "/posts").to route_to( :controller => "posts", :action => "index")
      end
      it "routes to posts new" do
        expect(:get => "/posts/new").to route_to( :controller => "posts", :action => "new")
      end
      it "routes to posts show" do
        expect(:get => "/posts/1").to route_to( :controller => "posts", :action => "show", id:"1")
      end
      it "routes to posts destroy" do
        expect(:delete => "/posts/1").to route_to( :controller => "posts", :action => "destroy", id:"1")
      end
    end

    describe "UsersController" do
      it "routes to users index" do
        expect(:get => "/users").to route_to( :controller => "users", :action => "index")
      end
      it "routes to users show" do
        expect(:get => "/users/1").to route_to( :controller => "users", :action => "show", id:"1")
      end
      it "routes to users new" do
        expect(:get => "/users/new").to route_to( :controller => "users", :action => "new")
      end
      it "routes to users create" do
        expect(:post => "/users").to route_to( :controller => "users", :action => "create")
      end
      it "routes to users edit" do
        expect(:get => "/users/1/edit").to route_to( :controller => "users", :action => "edit", id:"1")
      end
      it "routes to users update" do
        expect(:put => "/users/1").to route_to( :controller => "users", :action => "update", id:"1")
      end
      it "routes to users destroy" do
        expect(:delete => "/users/1").to route_to( :controller => "users", :action => "destroy", id:"1")
      end
    end
  end