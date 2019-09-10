class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.text :comment
      t.text :comment_title
      t.integer :star_rating
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
