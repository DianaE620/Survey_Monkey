before '/profile/:id' do
  redirect to("/?error_sesion=1") unless logged_in?
end

get '/user/new' do
  erb :new_user
end

post '/user/new' do

  name = params["nombre"]
  usuario = params["usuario"]
  correo = params["correo"]
  pass = params["pass"]

  new_user = User.new(name: name, user: usuario, email: correo)
  new_user.password = pass
  valido = new_user.validate
  #error = new_user.errors.full_messages

  if valido
    new_user.save
    session[:user_id] = new_user.id
    session[:nombre] = new_user.name
    redirect to("/profile/#{new_user.id}")
  else
    @error = 1
    erb :new_user
  end  

end


get '/login'  do
  erb :login
end

post '/login'  do
  correo = params["email"]
  pass = params["pass"]

  @user = User.authenticate(correo, pass)

  if @user 
    session[:user_id] = @user.id
    session[:nombre] = @user.name
    
    redirect to("/profile/#{@user.id}")
  else
    @error = 1
    erb :login
  end

end

get '/profile/:id' do

  id = params["id"]
  @user = User.find(id)

  erb :profile
  
end

get '/logout' do
  session.clear
  redirect to("/")
end