class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description

      t.integer :year
      t.numeric :runtime

      t.numeric :rating
      t.text :image

      t.timestamps
    end
  end
end
