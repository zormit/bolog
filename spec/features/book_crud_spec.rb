# very helpful: http://lonelyproton.com/posts/2-dealing-with-http-basic-authentication-in-tests
require 'helpers/basic_auth.rb'

describe "the book CRUD process", :type => :feature do

  it "lists books for everyone" do
    visit '/books'
    expect(page).to have_content 'Listing books'
  end

  it "fails when not authenticated" do
    visit '/books/new'
    expect(page.status_code).to eq 401
  end

  it "shows the page when authenticated" do
    authenticate
    visit '/books/new'
    expect(page).to have_content 'New Book'
  end

  it "doesn't allow creating a book without Topic" do
    authenticate
    visit '/books/new'
    fill_in('Title', with: 'Testbook')
    fill_in('Isbn', with: '1234')
    fill_in('Name', with: 'JBY')
    click_button('Create Book')
    expect(page).to have_content 'Topic must exist'
  end

  it "allows creating a book with existing Topic" do
    authenticate
    visit '/books/new'
    fill_in('Title', with: 'Testbook')
    fill_in('Isbn', with: '1234')
    fill_in('Name', with: 'JBY')
    fill_in('Topic', with: 'Testtopic')
    click_button('Create Book')
    #expect(page).to h
  end

end
