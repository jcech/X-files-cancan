class AddSecurityAccessToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :security_access, :integer
  end
end
