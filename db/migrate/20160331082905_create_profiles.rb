class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :member, index: true, foreign_key: true
      t.string :short_description
      t.string :about
      t.string :facebook_link
      t.string :twitter_link
      t.string :linkedin_link
      t.datetime :DOB
      t.string :country
      t.string :state
      t.string :city
      t.string :gender

      t.timestamps null: false
    end
  end
end
