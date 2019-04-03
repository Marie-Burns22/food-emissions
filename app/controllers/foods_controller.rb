require 'rack-flash'
class FoodsController < ApplicationController
use Rack::Flash

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

      if @food.save == true
        flash[:message] = "You successfully added #{@food.name} to the collection!"
        redirect "/foods"
      else
        flash[:message] = "Your greenhouse gas emissions must be between 0-10"
        redirect "/foods/new"
      end
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
    if logged_in? && current_student.id == @food.student_id

      @food.name = params[:name]
      @food.ghg_amount = params[:ghg_amount]
      @food.source = params[:source]
      @food.save
      if @food.save
        flash[:message] = "You updated #{@food.name}."
        redirect "/students/#{@food.student_id}"
      else
        flash[:message] = "Your greenhouse gas emissions must be between 0-10"
        redirect "/students/#{@food.student_id}"
      end

    else
      redirect "/failure"
    end
  end

  # DELETE: /foods/5/delete
  delete "/foods/:id/delete" do
    @food = Food.find_by_id(params[:id])
    not_logged_in_redirect
    if current_student.id == @food.student_id || @food.student_id == nil
      @food.delete
      redirect "/students/#{@food.student_id}"
    else
      redirect '/failure'
    end
  end

  get '/failure' do
    erb :"/students/failure"
  end

end
