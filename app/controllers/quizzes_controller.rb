class QuizzesController < ApplicationController

  before_action :get_quiz, except: :index
  before_action :get_painting, only: :show
  before_action :get_question_number, only: [:submit, :show]


  def index
    session[:current_quiz] = nil
  end

  def show
    get_answers
  end

  def new
    session[:current_quiz] = nil
    redirect_to "/quiz"
  end

  def submit
    answer = params["selected_answer"]
    @quiz.answers = @quiz.answers << answer
    session[:current_quiz] = @quiz
    if @question_number < 5
      redirect_to "/quiz"
    else
      redirect_to "/results"
    end
  end

  def results
    @summary = result_summary
  end

  private
    def get_painting
      if @quiz.paintings.count == @quiz.answers.count
        loop do
          @painting = Painting.offset(rand(Painting.count)).first
          break unless @quiz.paintings.include?(@painting.id)
        end
        @quiz.paintings = @quiz.paintings << @painting.id
        session[:current_quiz] = @quiz
      else
        @painting = Painting.find(@quiz.paintings.last)
      end
    end

    def result_summary
      summary = {correct_answers: 0, answers: []}
      @quiz.paintings.each_with_index do |painting_key, index|
        painting = Painting.find(painting_key)
        correct = painting.location == @quiz.answers[index]
        summary[:correct_answers] += 1 if correct
        summary[:answers] << {painting_location: painting.location,
                              correct: correct.to_s,
                              given_answer: @quiz.answers[index],
                              thumbnail_url: painting.thumbnail_url,
                              info_url: "http://www.europeana.eu/portal/en/record/#{painting.europeana_id}.html"}
      end
      summary
    end


    def get_answers
      answers = [@painting.location]
      while answers.count < 4 do
        answers << Painting.offset(rand(Painting.count)).first.location
        answers.uniq!
      end
      @answers = answers.shuffle
    end

    def get_question_number
      @question_number = @quiz.paintings.count
    end

    def get_quiz
      if session[:current_quiz]
        @quiz = Quiz.new(session[:current_quiz])
      end
      @quiz ||= Quiz.new
      session[:current_quiz] = @quiz
    end
end
