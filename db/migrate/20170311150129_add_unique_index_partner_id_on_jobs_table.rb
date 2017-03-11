class AddUniqueIndexPartnerIdOnJobsTable < ActiveRecord::Migration[5.0]
  def change
    add_index :jobs, :partner_id, unique: true
  end
end
