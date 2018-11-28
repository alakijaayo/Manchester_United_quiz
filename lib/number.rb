class Number

  attr_reader :question, :answers

  def initialize
    @question = 0
    @answers = 0
  end

  def add
      @question = question + 1
  end

  def correct
    @answers = answers + 1
  end

end
