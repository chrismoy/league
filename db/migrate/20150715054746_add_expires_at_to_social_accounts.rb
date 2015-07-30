class AddExpiresAtToSocialAccounts < ActiveRecord::Migration
  def change
    add_column :social_accounts, :expires_at, :integer
  end
end
