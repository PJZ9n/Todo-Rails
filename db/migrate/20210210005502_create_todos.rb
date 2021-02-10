class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :detail, null: false
      t.integer :state, null: false, default: 0
      t.date :limit, null: false

      t.timestamps
    end
  end
end
