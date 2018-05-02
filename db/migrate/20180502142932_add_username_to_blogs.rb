class AddUsernameToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :user_name, :text
  end
end
