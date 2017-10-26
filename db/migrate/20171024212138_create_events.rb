class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
    	t.integer :creator_id
      t.string :location
      t.string :date
      t.string :description

      t.timestamps
    end
  end
end

