class CreateGroupmembers < ActiveRecord::Migration[6.0]
  def change
    create_table :groupmembers do |t|
      t.references :group, foriegn_key: true
      t.references :transactions, foriegn_key: true
      t.timestamps
    end
  end
end
