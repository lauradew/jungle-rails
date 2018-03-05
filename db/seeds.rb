# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

prod1 = cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

user1 = User.create!({
  first_name: 'Hi',
  last_name: 'hi',
  email: 'hi@hi.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
})


review1 = Review.create!({
  product: prod1,
  user: user1,
  description: 'new favourite shirt!',
  rating: 5
  })

review2 = Review.create!({
  product_id: 2,
  user_id: 1,
  description: 'super uncomfortable',
  rating: 2
  })

review3 = Review.create!({
  product_id: 2,
  user_id: 1,
  description: 'great for work!',
  rating: 4
  })

review4 = Review.create({
  product_id: 2,
  user_id: 1,
  description: 'love the design hate the fit',
  rating: 3
  })

review5 = Review.create({
  product_id: 2,
  user_id: 1,
  description: 'terrible fabric',
  rating: 1
  })

review6 = Review.create({
  product_id: 2,
  user_id: 1,
  description: "I'd rather wear anything else",
  rating: 1
  })

review7 = Review.create({
  product_id: 1,
  user_id: 1,
  description: 'makes me feel like a model',
  rating: 5
  })

review8 = Review.create({
  product_id: 1,
  user_id: 1,
  description: 'worth every penny',
  rating: 5
  })

review9 = Review.create({
  product_id: 1,
  user_id: 1,
  description: 'softest, most well-structured shirt on the market. great for any occasion',
  rating: 4
  })

review10 = Review.create({
  product_id: 12,
  user_id: 1,
  description: 'best bookshelf ever! my cats love the topmost shelf',
  rating: 5
  })

review11 = Review.create({
  product_id: 12,
  user_id: 1,
  description: 'wonderful! no need for bookends because the shelves are tilted!',
  rating: 5
  })

review12 = Review.create({
  product_id: 12,
  user_id: 1,
  description: 'a true statement piece, but it has given me nightmares',
  rating: 2
  })

review13 = Review.create({
  product_id: 7,
  user_id: 1,
  description: 'so fun I broke both my ankles. rad!',
  rating: 4
  })

review14 = Review.create({
  product_id: 7,
  user_id: 1,
  description: 'even glides over water!',
  rating: 5
  })

review15 = Review.create({
  product_id: 4,
  user_id: 1,
  description: "gives a real bad case of the feet sweats but will make you look like you're trendy without trying. a hipster essential. plus people will think you're even cooler if you have feet sweats and don't care.",
  rating: 2
  })

review16 = Review.create({
  product_id: 4,
  user_id: 1,
  description: 'fractals on the foot phalanges! geometrical shapes are the bees knees.',
  rating: 5
  })

review17 = Review.create({
  product_id: 5,
  user_id: 1,
  description: 'these upped my espionnage big time',
  rating: 5
  })

review18 = Review.create({
  product_id: 5,
  user_id: 1,
  description: 'no grip! I was slipping all over the place! no spy should put up with this bullshit',
  rating: 1
  })

review19 = Review.create({
  product_id: 5,
  user_id: 1,
  description: 'minimal arch support, but with a good set of insoles they do the job',
  rating: 3
  })


puts "DONE!"
