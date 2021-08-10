class AddColumnToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :status, :integer
  end
end
