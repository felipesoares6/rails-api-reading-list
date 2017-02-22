require "test_helper"
require "minitest/pride"

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: "Pragmatic Programmer", rating: 5)
    Book.create!(title: "Enders Game", rating: 4)
  end

  test "listing books" do
    get "/books"

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type

    assert_equal Book.count, JSON.parse(response.body).size
  end

  test "listing top rated books" do
    get '/books?rating=5'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type

    assert_equal 1, JSON.parse(response.body).size
  end
end
