# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create(email: 'oanasipos@gmail.com', password: 'password', password_confirmation: 'password')
User.create(email: 'koen@up-nxt.com', password: '12345678', password_confirmation: '12345678')
User.create(email: 'tassos@natsakis.com', password: 'password', password_confirmation: 'password')
User.create(email: 'oana.sipos@up-nxt.com', password: 'password', password_confirmation: 'password')

Supplier.delete_all
colruyt = Supplier.create(id: 1, name: 'colruyt')

Article.delete_all
Article.create(article_code: '123', supplier_id: '1', description: 'banana', price_per_unit: '1', unit: 'kg')
Article.create(article_code: '234', supplier_id: '1', description: 'apple', price_per_unit: '1.2', unit: 'kg')
Article.create(article_code: '345', supplier_id: '1', description: 'plum', price_per_unit: '1.3', unit: 'kg')
Article.create(article_code: '456', supplier_id: '1', description: 'ananas', price_per_unit: '1.4', unit: 'kg')
Article.create(article_code: '567', supplier_id: '1', description: 'strawberries', price_per_unit: '1.5', unit: 'kg')

Order.delete_all

OrderLine.delete_all