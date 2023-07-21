class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :furigana
      t.boolean :attend
      t.integer :rank_id
      t.integer :place_id

      t.timestamps
    end
  end
end
