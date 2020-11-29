class CreateNutritionReports < ActiveRecord::Migration[6.0]
  def change
    create_table :nutrition_reports do |t|
      t.integer :user_id
      t.string :reportName
      t.date :intakeDate
      t.string :intakes

      t.timestamps null:false
    end
  end
end
