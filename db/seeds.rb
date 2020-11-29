# User.destroy_all
# NutritionReport.destroy_all

User.create(name: "administrator", username: "adminuseraccount", email: "test@mail.com", password_digest: "123", bmi: 0)
intakes = [
  { 
    calories: 267,
    carbs: 48.68,
    fat: 3.24,
    fiber: 4,
    id: "food_a3049hmbqj5wstaeeb3udaz6uaqv0.9849380415001951",
    img: "https://www.edamam.com/food-img/886/886960f6ce6ccec5b9163bacf2996853.jpg",
    name: "bread",
    protein: 10.72,
    quantity: 1,
  },
  {
    calories: 163,
    carbs: 3.83,
    fat: 8.6,
    fiber: 1.3,
    id: "food_bd97wcfb5tcjnybmibiyeaqrernd0.23080829580997642",
    img: "https://www.edamam.com/food-img/a4b/a4ba02f547d69f0ab89ae266903f1e49.jpg",
    name: "ham",
    protein: 16.6,
    quantity: 1,
  }
]
NutritionReport.create(user_id: User.all.sample.id, reportName: "Test", intakeDate: Date.new(2020,11,28), intakes: intakes)