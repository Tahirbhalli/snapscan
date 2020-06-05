class CreateGroupmembers < ActiveRecord::Migration[6.0]
  def change
    create_table :groupmembers do |t|
      t.references :group, foreign_key: true
      t.references :transactin, foreign_key: true
      t.timestamps
    end
  end
end
