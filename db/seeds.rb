# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

department = Department.create(name: "总裁办", is_default: true)
u = User.create(name: :admin, true_name: "超管", password: :admin123, phone: "admin", role: User.roles[:admin])
UserDepartment.create(user: u, department: department)



puts "init success!"