class AddColumnToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :blogs, :users, column: :user_id, primary_key: :id
  end
end
