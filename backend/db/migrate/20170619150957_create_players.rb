class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :score
      t.string :time
      t.boolean :win, default: false

      t.timestamps
    end
  end
end
