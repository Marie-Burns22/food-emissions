class FoodsController < ApplicationController

  # GET: /foods
  get "/foods" do
    @foods = Food.all
    erb :"/foods/index.html"
  end

  # GET: /foods/new
  get "/foods/new" do
    erb :"/foods/new.html"
  end

  # POST: /foods
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
