
### app/controllers/concerns/rate_limiter.rb

module RateLimiter
	LIMIT = 5
	WINDOW = 1.miniute


	def rate_limit!
		key = "rate_limit: #{request.remote_ip}"
		count = redis.get(key).to_i
		# Rails.cache.read(key).to_i

		if count >= LIMIT
			render json: { error: "Rate Limit exceeded"}, status: :too_many_requests
		else
			redis. multi do
				redis.incr(key)
				redis.expire(key, WINDOW)
			end

			Rails.cache.increment(key, 1,expires_in: WINDOW)
		end

	end

	def redis
		@redis ||= Redis.new
	end
end