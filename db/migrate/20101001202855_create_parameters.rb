class CreateParameters < ActiveRecord::Migration
  def self.up
    create_table :parameters do |t|
      t.string :main
      t.string :keyword_a
      t.string :keyword_b
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :parameters
  end
end
