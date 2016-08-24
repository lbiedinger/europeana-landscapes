class Quiz

  def initialize quiz_hash = {}
    self.paintings = quiz_hash["paintings"] if quiz_hash["paintings"]
    self.answers = quiz_hash["answers"] if quiz_hash["answers"]
  end

  def paintings
    @paintings ||= []
  end

  def paintings= painting_array
    @paintings = painting_array
  end

  def answers
    @answers ||= []
  end

  def answers= answer_array
    @answers = answer_array
  end
end
