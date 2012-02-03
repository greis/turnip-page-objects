steps_for :search_result_page do

  def valid_search_result_page?
    page.has_content?('Search Result')
  end

  step 'I should see the following results:' do |table|
    result = page.all('.document').map do |e|
      {
        'title' => e.find('h3').text,
        'url' => e.find('cite').text
      }
    end
    table.hashes.should == result
  end
end
