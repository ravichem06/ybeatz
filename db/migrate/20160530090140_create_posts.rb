class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :body
      t.references :topic, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
