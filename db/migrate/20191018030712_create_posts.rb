class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :text,           null: false
      t.text :code,           null: false
      t.text :image,           null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
