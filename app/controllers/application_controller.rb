require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auth_demo_lv"
  end

  get "/" do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_student
    end

    def current_student
      Student.find_by(:id => session[:user_id])
    end

    def logout!
      session.clear
    end

    def logged_in_redirect
      redirect '/foods' if logged_in?
    end

    def not_logged_in_redirect
      redirect '/' if !logged_in?
    end
  end

end
