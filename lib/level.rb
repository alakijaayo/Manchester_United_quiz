require 'pg'

class Level
  attr_reader :choice, :result

  def initialize(choice)
    @choice = choice
  end

  def load(question_number)
    if choice == "Easy"
      connection = PG.connect(dbname: 'easy_questions')
      @result = connection.exec("SELECT * FROM easy")[question_number]
    elsif choice == "Medium"
      connection = PG.connect(dbname: 'medium_questions')
      @result = connection.exec("SELECT * FROM medium")[question_number]
    elsif choice == "Hard"
      connection = PG.connect(dbname: 'hard_questions')
      @result = connection.exec("SELECT * FROM hard")[question_number]
    end
  end
end
