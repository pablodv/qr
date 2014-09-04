class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :code
      t.string :qr_code_uid
      t.string :qr_code_name

      t.timestamps
    end
  end
end
