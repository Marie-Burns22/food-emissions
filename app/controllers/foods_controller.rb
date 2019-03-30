class FoodsController < ApplicationController

  # GET: /foods
  get "/foods" do
    @foods = Food.all
    erb :"/foods/index.html"
  end

  # route to new food data form
  get "/foods/new" do
    not_logged_in_redirect
    erb :"/foods/new.html"
  end

  # create food data entry
  post "/foods" do

    redirect "/foods"
  end

  # GET: /foods/5
  get "/foods/:id" do
    erb :"/foods/show.html"
  end

  # GET: /foods/5/edit
  get "/foods/:id/edit" do
    erb :"/foods/edit.html"
  end

  # PATCH: /foods/5
  patch "/foods/:id" do
    redirect "/foods/:id"
  end

  # DELETE: /foods/5/delete
  delete "/foods/:id/delete" do
    redirect "/foods"
  end
end
