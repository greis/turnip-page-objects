steps_for :home_page do

  def visit_home_page
    visit '/'
  end

  def valid_home_page?
    page.has_content?('Home Page')
  end

  step 'I search for :term' do |term|
    fill_in('q', with: term)
    click_button('Search')
  end
end
