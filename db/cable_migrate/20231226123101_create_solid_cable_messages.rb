# This migration comes from solid_cable (originally 20231226123101)
class CreateSolidCableMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_cable_messages do |t|
      t.binary :channel, null: false, limit: 1024
      t.binary :payload, null: false, limit: 536870912
      t.datetime :created_at, null: false
      t.index [ :channel, :created_at ], name: "index_solid_cable_messages_on_channel_and_created_at"
      t.index [ :created_at ], name: "index_solid_cable_messages_on_created_at"
    end
  end
end
