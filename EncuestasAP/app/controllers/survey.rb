post '/survey/new' do 

  survey_name = params["survey_name"]
  user = User.find(session["user_id"])

  @survey = Survey.new(name: survey_name)

  if @survey.validate
    @survey.save
    user.authored_surveys << @survey
    redirect to("/survey/#{@survey.id}")
  else
    @survey
    erb :profile
  end

end

get '/survey/:id_survey' do
  survey_id = params["id_survey"]

  begin
    @survey = Survey.find(survey_id)
    erb :survey

  rescue
   redirect to ("/")
  end

end

post '/question/new' do
  pregunta = params["question"]
  id_survey = params["id"]
  survey = Survey.find(id_survey)

  @new_question = Question.new(name: pregunta)

  survey.questions << @new_question

  erb :question, layout: false

end

post '/option/new' do
  opcion = params["respuesta"]
  id_question = params["id_pregunta"]

  @new_option = Option.new(name: opcion)
  question = Question.find(id_question)

  question.options << @new_option

  @new_option.name

end














