class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :url
      t.date :year
      t.string :author

      t.timestamps
    end
  end
end
