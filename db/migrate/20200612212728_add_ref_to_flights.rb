class AddRefToFlights < ActiveRecord::Migration[6.0]
  def change
    change_table :flights do |t|
      t.references :booking
    end
  end
end
