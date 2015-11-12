module AuthenticationHelpers
  def log_in_as!(user)
    visit '/login'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Log In'
    expect(page).to have_content("¡Hola, otra vez! ¡Que gusto verte!")
  end

  def log_in!(user)
    visit '/login'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Log In'
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
end

module AuthHelpers
  def log_in(user)
    session[:user_id] = user.id
  end
end

RSpec.configure do |c|
  c.include AuthHelpers, type: :controller
end