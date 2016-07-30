require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

helpers do
  def empty_fields?
    @empty_fields == nil || @empty_fields.empty?
  end
end

def empty_fields(payment)
  fields = payment.select { |k, v| v.size < 1 }

  fields.empty? ? nil : fields
end

def valid_card_number?(payment)
  card_number = payment.values_at("card number")[0]

  card_number.size == 16 ? true : false
end

before do
  session[:payments] ||= []
end

get '/' do
  redirect '/payments/create'
end

get "/payments/create" do
  erb :form
end

post '/payments/create' do
  payment = {"first name" => params[:first],
    "last name" => params[:last],
    "card number" => params[:card_number],
    "expiration date" => params[:exp_date],
    "cvv" => params[:cvv]
  }

  @empty_fields = empty_fields(payment) 

  if @empty_fields 
    erb :form
  elsif !valid_card_number?(payment)
    session[:message] = "Invalid Card Number"
    erb :form
  else
    session[:payments].push(payment)
    session[:message] = "Thank you for your payment."
    redirect "/payments"
  end
end

get '/payments' do
  @date_time = Time::now
  erb :payments
end
