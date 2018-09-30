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
      srand(345)
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

  feature '#medium' do
    scenario 'It loads the medium questions' do
      medium_sign
      expect(page).to have_content "Who did Manchester United beat in the Quarter-Final on their way to winning the Champions League in 1999?"
    end

    scenario 'it praises the player on getting a medium question right' do
      srand(123)
      medium_sign
      click_button 'Inter Milan'
      expect(page).to have_content 'Well Done!'
    end

    scenario 'It tells the player they got a medium question wrong' do
      srand(345)
      medium_sign
      click_button 'Borussia Dortmund'
      expect(page).to have_content 'Wrong!'
    end

    scenario 'it tells the player if they made a bad choice in medium' do
      srand(345)
      medium_sign
      click_button 'Valencia'
      expect(page).to have_content 'Wrong!'
    end

    scenario 'it tells the player if they made the wrong choice in medium' do
      srand(345)
      medium_sign
      click_button 'Dynamo Kiev'
      expect(page).to have_content 'Wrong!'
    end
  end

  feature '#hard' do
    scenario 'It loads the hard questions' do
      hard_sign
      expect(page).to have_content "Manchester United won their first European Cup/Champions League in 1968. But which Maltese football team did they beat in the first round 4-0 on aggregate?"
    end

    scenario 'it praises the player on getting a hard question right' do
      srand(123)
      hard_sign
      click_button 'Hibernians'
      expect(page).to have_content 'Well Done!'
    end

    scenario 'It tells the player they got a hard question wrong' do
      srand(345)
      hard_sign
      click_button 'Mosta'
      expect(page).to have_content 'Wrong!'
    end

    scenario 'it tells the player if they made a bad choice in hard' do
      srand(345)
      hard_sign
      click_button 'Qormi'
      expect(page).to have_content 'Wrong!'
    end

    scenario 'it tells the player if they made the wrong choice in hard' do
      srand(345)
      hard_sign
      click_button 'Floriana'
      expect(page).to have_content 'Wrong!'
    end
  end
end
