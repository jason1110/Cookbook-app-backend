class CreateCookbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbooks do |t|
        t.string :name
        t.references :user, null: false, foreign_key: true
        t.references :recipe, null: false, foreign_key: true
      t.timestamps
    end
  end
end
