def easy_sign
  visit('/')
  select 'Easy', from: 'level'
  click_button 'Submit'
end

def medium_sign
  visit('/')
  select 'Medium', from: 'level'
  click_button 'Submit'
end

def hard_sign
  visit('/')
  select 'Hard', from: 'level'
  click_button 'Submit'
end
