# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
# Start seeding
Product.create(title: 'Programming Ruby 1.90',
              description: %{
                <p>Ruby is the fastest growing and most exciting dynamic language
                out there. If you need to get working programs delivered fast,
                you should add Ruby to your toolbox.</p>
                },
                image_url: 'ruby.png',
                price: 49.95)
Product.create(title: 'Programming Python',
              description: %{
                Pyhton is really a simple and powerful language.
                You should master it as you go.
                },
                image_url: 'python.png',
                price: 59.95)
