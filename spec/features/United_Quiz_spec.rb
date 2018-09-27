feature 'United Quiz' do
  scenario 'it welcomes you to the quiz' do
    visit('/')
    expect(page).to have_content "Hello and welcome to the Manchester United Quiz!"
  end

  scenario 'it allows you to pick easy questions' do
    easy_sign
    expect(page).to have_content "You have selected the Easy questions."
  end

  scenario 'it allows you to pick medium questions' do
    medium_sign
    expect(page).to have_content "You have selected the Medium questions."
  end

  scenario 'it allows you to pick hard questions' do
    hard_sign
    expect(page).to have_content "You have selected the Hard questions. Only for the Die Hard Red Devils!!"
  end

  scenario 'It tells the player to try again' do
    visit('/')
    select 'Select', from: 'level'
    click_button 'Submit'
    expect(page).to have_content "Er.... not sure what a Select level is... go back and try again!"
  end

  scenario 'It loads the easy questions' do
    easy_sign
    expect(page).to have_content "What year did United win the Treble?"
  end
end
