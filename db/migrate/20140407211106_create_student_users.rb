class CreateStudentUsers < ActiveRecord::Migration
  def change
    create_table :student_users do |t|
      t.string   :school_level
      t.string   :school_name
      t.string   :team_name
      t.string   :pay_code
      t.string   :first_name
      t.string   :last_name
      t.string   :team_code
      t.timestamps null: false
    end
  end
end
