### app/models/post.rb


class Post < ApplicationRecord
	validates :title, presence: true
	validtes :content, presence: true
end



# rails generate model Post title:text content:text

# create_table :posts do |t|
# 	t.string :title, null: false
# 	t.text :content, null: false
# end