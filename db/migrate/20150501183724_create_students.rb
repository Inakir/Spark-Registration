class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :school_level
      t.string :school_name
      t.string :team_name
      t.string :pay_code

      t.timestamps null: false
    end
  end
end
