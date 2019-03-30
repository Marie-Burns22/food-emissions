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
    if logged_in? && !params[:name].empty? && !params[:ghg_amount].empty? && !params[:source].empty?

      @food = Food.create(params)
      @food.student = current_student
      @food.save

      redirect "/foods"
    else
      redirect "/foods/new"
    end
  end

  # GET: /foods/5
  get "/foods/:id" do
    erb :"/foods/show.html"
  end

  # route to edit food form
  get "/foods/:id/edit" do
    not_logged_in_redirect
    @food = Food.find_by_id(params[:id])
    erb :"/foods/edit.html"
  end

  # PATCH: /foods/5
  patch "/foods/:id" do
    @food = Food.find_by_id(params[:id])
    if logged_in && current_student == @food.student_id

      @food.name = params[:name]
      @food.ghg_amount = params[:ghg_amount]
      @food.source = params[:source]
      @food.save
      redirect "/foods"
    else
      redirect "/"
    end
  end

  # DELETE: /foods/5/delete
  delete "/foods/:id/delete" do
    redirect "/foods"
  end
end
