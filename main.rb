require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?

get '/' do
  erb :home
end

get'/faqs' do
  erb :faqs
end

get '/about_us' do
  erb :about_us
end

get '/sleeps_till_xmas' do
  erb :sleeps_till_xmas
end

get '/calculate' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

  @result = case @operator
  when '+'
    @first_number + @second_number
  when '-'
    @first_number - @second_number
  when '*'
    @first_number * @second_number
  when '/'
    @first_number / @second_number
  when 's'
    Math.sqrt(@first_number)
  when 'p'
    @first_number ** @second_number
  end

  erb :result
end

get '/age_calculate' do
  if params[:dob]
    @today = Date.today
    @dob = Date.parse(params[:dob])

    @age_result = @today.year - @dob.year - ((@today.month > @dob.month || (@today.month == @dob.month && @today.day >= @dob.day)) ? 0 : 1)
  end

  erb :age_result
end



get '/volume_calculate' do
  @number = params[:number].to_f
  @vol_op = params[:vol_op]

  @volume_result = case @vol_op
  when 'cube'
    @number ** 3
  when 'sphere'
   (4.0 / 3.0) * Math::PI * (@number **3)
  end
  erb :volume_result
end

get '/multiply/:x/:y' do
  @result = params[:x].to_i * params[:y].to_i
  erb :result
end