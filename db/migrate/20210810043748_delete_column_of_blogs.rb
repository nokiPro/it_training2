class DeleteColumnOfBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :status, :integer
  end
end
