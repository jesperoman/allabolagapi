class CreateCaches < ActiveRecord::Migration
  def change
    create_table :caches do |t|
      t.string :name
      t.string :orgnr

      t.timestamps
    end
  end
end
