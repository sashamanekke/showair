class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # @user = @user.reservations
    # @pippo = 1

  end


end


 # create_table "users", force: :cascade do |t|
 #    t.string "name"
 #    t.string "address"
 #    t.string "surname"
 #    t.boolean "host"
 #    t.datetime "created_at", null: false
 #    t.datetime "updated_at", null: false
 #    t.string "email", default: "", null: false
 #    t.string "encrypted_password", default: "", null: false
 #    t.string "reset_password_token"
 #    t.datetime "reset_password_sent_at"
 #    t.datetime "remember_created_at"
 #    t.integer "sign_in_count", default: 0, null: false
 #    t.datetime "current_sign_in_at"
 #    t.datetime "last_sign_in_at"
 #    t.inet "current_sign_in_ip"
 #    t.inet "last_sign_in_ip"
 #    t.index ["email"], name: "index_users_on_email", unique: true
 #    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
 #  end
