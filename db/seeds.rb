# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!({email: "austinktang@gmail.com", password: 'test123', password_confirmation: 'test123' ,name: "test_admin", phone:"12345561111",fax:"12345561111",right_sig_url: "www.google.com",mkt_place_url:"www.google.com",usertype:"admin",super_admin:"true"})
StudentUser.create!({school_level: "Elementary", school_name: "TAMU", team_name: "Brogrammers", pay_code: "test_code", first_name: "Eric", last_name: "Ramon", team_code: "123456", email: "eramon224@tamu.edu", pay_status: "no", password: "444444", password_digest: "444444"})

