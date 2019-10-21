class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :tag, unique: true
      t.timestamps
    end
  end
end
