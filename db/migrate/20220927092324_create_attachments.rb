class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.references :communication,
                   null: false,
                   foreign_key: { to_table: :communications },
                   index: { name: :attachments_communication_communications_reference }

      t.timestamps
    end
  end
end
