# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "アニメ・漫画")
Category.create(name: "働き方・仕事")
Category.create(name: "スポーツ")
Category.create(name: "ゲーム")
Category.create(name: "読書")
Category.create(name: "映画・舞台")
Category.create(name: "写真")
Category.create(name: "イラスト")
Category.create(name: "音楽")
Category.create(name: "芸能人・有名人")
Category.create(name: "料理・グルメ")
Category.create(name: "政治・経済")

User.create(name: "Angy", email: "a@example.com", password: "1111aaaa", password_confirmation: "1111aaaa")