require './lib/level'

describe Level do
  subject(:easy) { described_class.new("Easy") }
  subject(:medium) { described_class.new("Medium") }
  subject(:hard) { described_class.new("Hard") }
  subject(:select) { described_class.new("Select") }

  it 'stores the level choice of the player if Easy' do
    expect(easy.choice).to eq "Easy"
  end

  it 'stores the level choice of the player if Medium' do
    expect(medium.choice).to eq "Medium"
  end

  it 'stores the level choice of the player if Hard' do
    expect(hard.choice).to eq "Hard"
  end

  it 'stores the level choice of the player if Select' do
    expect(select.choice).to eq "Select"
  end

  describe '.load' do
    it 'loads the easy questions from the database' do
      connection = PG.connect(dbname: 'easy_questions')
      beginner = easy.load(0)
      expect(beginner).to include("question" => "What year did United win the Treble?")
    end

    it 'loads the medium questions from the database' do
      connecion = PG.connect(dbname: 'medium_questions')
      advanced = medium.load(0)
      expect(advanced).to include("question" => "Who did Manchester United beat in the Quarter-Final on their way to winning the Champions League in 1999?")
    end

    it 'loads the hard questions from the database' do
      connection = PG.connect(dbname: 'hard_questions')
      expert = hard.load(0)
      expect(expert).to include("question" =>"Manchester United won their first European Cup/Champions League in 1968. But which Maltese football team did they beat in the first round 4-0 on aggregate?")
    end
  end
end
