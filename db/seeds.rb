puts 'Cleaning database...'
Shower.destroy_all
User.destroy_all
Reservation.destroy_all

puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    name:    Faker::Name.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    surname: Faker::Name.last_name,
    avatar: "https://picsum.photos/200/300/?random",
    email: Faker::Internet.email,
    host: false,
    password: "topsecret"
    )
  user.save!
end
puts 'Finished!'

url = "https://picsum.photos/200/300/?random"
addresses = [
  'avenue victor jacobs 78, 1040 bruxelles',
  'avenue montjoie 118, 1180 Bruxelles',
  'grote hertstraat 5, 1653, Dworp'
]

puts 'Creating 15 fake showers...'
15.times do
  shower = Shower.new(
    title:    Faker::Space.planet,
    address: addresses.sample,
    user: User.all.sample,
    price: Faker::Number.decimal(2),
    description: Faker::Coffee.blend_name
    )
  shower.save!
  shower.picture_urls = [url]
end
puts 'Finished!'

# puts 'Creating 20 fake reservations...'
# 20.times do
#   reservation = Reservation.new(
#     hour: Time.now,
#     user: User.all.sample,
#     shower: Shower.all.sample
#     )
#   reservation.save!
# end
# puts 'Finished!'

# create_table "reservations", force: :cascade do |t|
#   t.time "hour"
#   t.bigint "user_id"
#   t.bigint "shower_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["shower_id"], name: "index_reservations_on_shower_id"
#   t.index ["user_id"], name: "index_reservations_on_user_id"
# end

 # create_table "showers", force: :cascade do |t|
 #    t.string "address"
 #    t.bigint "user_id"
 #    t.string "picture"
 #    t.string "title"
 #    t.string "description"
 #    t.integer "price"
 #    t.datetime "created_at", null: false
 #    t.datetime "updated_at", null: false
 #    t.index ["user_id"], name: "index_showers_on_user_id"
 #  end

# create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.string "address"
#     t.string "surname"
#     t.boolean "host"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer "sign_in_count", default: 0, null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.inet "current_sign_in_ip"
#     t.inet "last_sign_in_ip"
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end
