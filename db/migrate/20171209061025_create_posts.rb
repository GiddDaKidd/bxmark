class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :blog_category_id
            t.integer :user_id
            t.string :title
            t.text :description
            t.date :date_created
            t.timestamps null: false
    end
  end
end
