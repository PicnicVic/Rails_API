class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :comment
      t.integer :rating
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
