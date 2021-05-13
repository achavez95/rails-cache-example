class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.bigint :points, default: 0
      t.belongs_to :team

      t.timestamps
    end
  end
end
