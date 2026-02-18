User.find_each(batch_size: 1000) do |user|
	process(user)
end

User.find_in_batches(batch_size: 1000) do |user|
	batch.each { |user| process (user)}
end


USer.all.each { |user| process(user.id,user.name)}

User.pluck(:id,:name)each