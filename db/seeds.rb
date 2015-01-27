# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
text = <<-EOSTRING
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
EOSTRING

User.create(
  email: "email@email.com",
  password_digest: Monban.hash_token("password")
)

User.create(
  email: "tester@tester.com",
  password_digest: Monban.hash_token("password")
)

post_one = Post.create(
  title: "My first post",
  content: text,
  user_id: 1
)

post_two = Post.create(
  title: "Another post!",
  content: text,
  user_id: 1
)

post_three = Post.create(
  title: "What a beautiful day!",
  content: text,
  user_id: 2
)

tag_one = Tag.create(
  name: "Awesome"
)

tag_two = Tag.create(
  name: "Cool"
)

post_one.tags << tag_one
post_one.tags << tag_two
post_two.tags << tag_two
