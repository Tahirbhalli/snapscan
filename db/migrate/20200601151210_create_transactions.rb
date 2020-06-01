class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :amount
      t.timestamps
    end
  end
end
