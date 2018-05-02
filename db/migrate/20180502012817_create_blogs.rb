class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text :content
      t.text :image
      t.integer :user_id
    end
  end
end
