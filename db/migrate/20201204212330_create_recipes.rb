class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :href
      t.string :thumbnail
      t.string :ingredients

      t.timestamps
    end
  end
end
