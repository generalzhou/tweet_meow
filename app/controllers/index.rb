get '/' do
  erb :index
end

post '/tweet' do
  Twitter.update(params[:tweet])
  redirect '/'
end

