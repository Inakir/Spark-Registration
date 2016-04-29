# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create!({email: "austinktang@gmail.com", password: 'test123', password_confirmation: 'test123' ,name: "test_admin", phone:"12345561111",fax:"12345561111",right_sig_url: "https://www.google.com",mkt_place_url:"https://www.google.com/",usertype:"admin",super_admin:"true"})
Admin.create!({email: "admin@gmail.com", password: 'test123', password_confirmation: 'test123' ,name: "test_admin", phone:"12345561111",fax:"12345561111",right_sig_url: "https://www.google.com",mkt_place_url:"https://www.google.com",usertype:"admin",super_admin:"false"})
StudentUser.create!({school_level: "Elementary", school_name: "TAMU", team_name: "Brogrammers", pay_code: "test_code", first_name: "Eric", last_name: "Ramon", team_code: "123456", email: "eramon224@tamu.edu", pay_status: "no", password: "444444", password_confirmation: '444444'})
AdvisorUser.create!({username: "advisor@test.com",usertype: "advisor",school_level: "High", school_name: "TAMU", team_name: "Brogrammers", pay_code: "test_code", first_name: "first", last_name: "last", team_code: "123456", password: "test123", password_confirmation: 'test123'})
StudentUser.create!({school_level: "Elementary", school_name: "TAMU", team_name: "Brogrammers", pay_code: "test_code", first_name: "Billy", last_name: "Bob", team_code: "123457", email: "eramon224@live.com", pay_status: "yes", password: "444444", password_confirmation: "444444"})

