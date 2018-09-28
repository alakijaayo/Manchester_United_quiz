require 'pg'

class Level
  attr_reader :choice, :result

  def initialize(choice)
    @choice = choice
  end

  def load
    choice == "Easy"
    connection = PG.connect(dbname: 'easy_questions')
    @result = connection.exec("SELECT * FROM easy")[0]
  end  
end
