class AddMissingAttributesToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :author, :string
    add_column :books, :review, :text
    add_column :books, :genre_id, :integer
    add_column :books, :amazon_id, :string
  end
end
