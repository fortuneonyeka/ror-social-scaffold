class CreateFriendshipRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friendship_requests do |t|
      t.references :inviter, null: false, foreign_key: { to_table: :users }, index: true
      t.references :invitee, null: false, foreign_key: { to_table: :users }, index:true
      t.string :status

      t.timestamps
    end
  end
end
