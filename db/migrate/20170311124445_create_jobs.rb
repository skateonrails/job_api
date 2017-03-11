class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :partner_id
      t.string :title
      t.integer :category_id
      t.date :expires_at
      t.string :state, default: :draft

      t.timestamps
    end
  end
end
