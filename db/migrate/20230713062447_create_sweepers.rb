class CreateSweepers < ActiveRecord::Migration[7.0]
  def change
    create_table :sweepers do |t|
      t.string :name
      t.string :day

      t.timestamps
    end
  end
end
