class HighscoresController < ApplicationController
  def index
    @highscores = Highscore.order('score DESC').limit(10)
  end

  def create
    score = Integer(session[:score])

    if Highscore.order('score DESC').limit(10)[9].nil? || Highscore.order('score DESC').limit(10)[9].score < score
      highscore = Highscore.new(highscore_params)
      puts "highscore: #{highscore.inspect}"
      highscore.score = score
      highscore.save!
    end
    session[:score] = nil
    redirect_to "/highscores"
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def highscore_params
    puts "getting_highscore_params"

    params.require(:highscore).permit(:initials)
  end
end