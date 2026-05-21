class CreateQuotes < ActiveRecord::Migration[8.1]
  def change
    create_table :quotes do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
