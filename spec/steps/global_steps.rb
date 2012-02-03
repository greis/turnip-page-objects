steps_for :global do

  step 'I am on the :page_name page' do |page_name|
    page_name = normalize_page_name(page_name)
    enable_steps_for_page(page_name)
    visit_page(page_name)
    assert_valid_page(page_name)
  end

  step 'I should be on the :page_name page' do |page_name|
    page_name = normalize_page_name(page_name)
    enable_steps_for_page(page_name)
    assert_valid_page(page_name)
  end

  def normalize_page_name(page_name)
    page_name.gsub(' ','_').concat('_page')
  end

  def assert_valid_page(page_name)
    method_name = "valid_#{page_name}?"
    assert(send(method_name), "Invalid page: #{page_name}") if respond_to?(method_name)
  end

  def enable_steps_for_page(page_name)
    enable_steps_for(page_name)
    disable_steps_for(@previous_page) if @previous_page
    @previous_page = page_name
  end

  def visit_page(page_name)
    send("visit_#{page_name}")
  end
end



step 'the following documents:' do |table|
  table.hashes.each { |h| Document.create(h) }
end
