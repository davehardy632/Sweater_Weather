class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.json :data
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
