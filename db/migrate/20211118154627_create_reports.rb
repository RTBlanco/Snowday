class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.float :inches
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
