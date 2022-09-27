class CreateCommunications < ActiveRecord::Migration[7.0]
  def change
    create_table :communications do |t|
      t.references :creator,
                   null: false,
                   foreign_key: { to_table: :people },
                   index: { name: :communications_creator_people_reference }
      t.references :receiver,
                   null: false,
                   foreign_key: { to_table: :people },
                   index: { name: :communications_receiver_people_reference }
      t.string :subject
      t.text :contents
      t.references :previous_communication,
                   null: true,
                   foreign_key: { to_table: :communications },
                   index: { name: :previous_communication_reference }

      t.timestamps
    end
  end
end
