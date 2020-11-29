class NutritionReport < ApplicationRecord
    belongs_to :user
    serialize :intakes, JSON

    validates :reportName, presence: { message: "Must be given please" }
    validates :intakeDate, presence: { message: "Must be given please" }
    validates :intakes, presence: { message: "Must be given please" }

    validates :reportName, length: { minimum: 2 }

end