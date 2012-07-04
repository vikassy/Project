class AddInvitationsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :invitation, :text

  end
end
