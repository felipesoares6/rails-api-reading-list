require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  test 'creates new books' do
    post '/books',
     params: {
       book: { title: 'Pragmatic Programmer',
               rating: 5,
               author: 'Dave Thomas',
               genre_id: 1,
               review: 'Excellent book!',
               amazon_id: '13123'}
     }.to_json,

     headers: {
       'Accept' => 'application/json',
       'Content-Type' => 'application/json'
     }

    assert_equal 201, response.status
    assert_equal Mime[:json], response.content_type

    book = json(response.body)
    assert_equal book_url(book[:id]), response.location

    assert_equal 'Pragmatic Programmer', book[:title]
    assert_equal 5, book[:rating].to_i
    assert_equal 'Dave Thomas', book[:author]
    assert_equal 1, book[:genre_id]
    assert_equal 'Excellent book!', book[:review]
    assert_equal '13123', book[:amazon_id]
  end

  test 'does not create books with invalid data' do
    post '/books',
     params: {
       book: { title: nil, rating: 5 }
     }.to_json,

     headers: {
       'Accept' => 'application/json',
       'Content-Type' => 'application/json'
     }

     assert_equal 422, response.status
  end
end
