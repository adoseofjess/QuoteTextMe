class CreateScrapings < ActiveRecord::Migration
  def change
    create_table :scrapings do |t|

      t.timestamps
    end
  end
end
