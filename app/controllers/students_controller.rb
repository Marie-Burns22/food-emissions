class StudentsController < ApplicationController

  # GET: /students
  get "/students" do
    @students = Student.all
    erb :"/students/index.html"
  end

  # sign up page
  get "/students/signup" do
    logged_in_redirect
    erb :"/students/signup.html"
  end

  # POST: /students
  post "/students" do
    if Student.find_by(:email => params[:email])  #does not check for name duplicates since students could have same name
      redirect '/students/login'
    elsif !params[:email].empty? && !params[:password].empty? && !params[:name].empty?
      @student = Student.create(params)
      session[:user_id] = @student.id
      redirect '/foods'  #when users are logged in teh first page they are directed to is the food index
    else
      redirect '/students/signup'  #sends back to the signup page if not a user and not correct information
    end
  end

  get '/students/login' do
    logged_in_redirect
    erb :'students/login'
  end

  post '/login' do
    @student = Student.find_by(email: params[:email])
    if @student && @student.authenticate(params[:password])
      session[:user_id] = @student.id
      redirect '/foods'  #when users are logged in teh first page they are directed to is the food index
    else
      redirect '/login'
    end
  end

  # GET: /students/5
  get "/students/:id" do
    erb :"/students/show.html"
  end

  # GET: /students/5/edit
  get "/students/:id/edit" do
    erb :"/students/edit.html"
  end

  # PATCH: /students/5
  patch "/students/:id" do
    redirect "/students/:id"
  end

  # DELETE: /students/5/delete
  delete "/students/:id/delete" do
    redirect "/students"
  end

  get '/logout' do
    logout! if logged_in?
    redirect "/"
  end
end
