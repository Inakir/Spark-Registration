# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create!({email: "test_admin@gmal.com", password: 'test123', password_confirmation: 'test123' ,name: "test_admin", phone:"12345561111",fax:"12345561111",right_sig_url: "www.google.com",mkt_place_url:"www.google.com",usertype:"admin"})