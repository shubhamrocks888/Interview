### app/jobs/post_created_job.rb

class PostCreatedJob < ApplicationJob
	queue_as :default

	def perform(post_id)
		post  = Post.find_by(id: post_id)

		return unless post

		Rails.logger.info "Post created: #{{post.title}"

	end
end
