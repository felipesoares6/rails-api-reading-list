require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @scifi = Genre.create!(name: 'Science Fiction')
    @book = @scifi.books.create!(title: 'Pragmatic Programer')
  end

  test 'delete books' do
    delete "/books/#{@book.id}"

    assert_equal 204, response.status
  end
end
