class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.references :booking
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
