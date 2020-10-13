class AddUserToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :user, index: true
  end
end
