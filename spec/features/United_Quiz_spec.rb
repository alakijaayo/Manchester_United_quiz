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

  feature '#easy' do
    scenario 'It loads the easy questions' do
      easy_sign
      expect(page).to have_content "What year did United win the Treble?"
    end

    scenario 'It praises the player on getting the question right' do
      srand(123)
      easy_sign
      click_button '1999'
      expect(page).to have_content 'Well Done!'
    end

    scenario 'It tells the player they got the question wrong' do
      srand(234)
      easy_sign
      click_button '2008'
      expect(page).to have_content 'Wrong!'
    end

    scenario 'it tells the player if they made a bad choice' do
      srand(345)
      easy_sign
      click_button '1968'
      expect(page).to have_content 'Wrong!'
    end

    scenario 'It tells the player they made the wrong choice' do
      srand(345)
      easy_sign
      click_button '1992'
      expect(page).to have_content 'Wrong!'
    end
  end
end
