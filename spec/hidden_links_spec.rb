require 'spec_helper'

feature "hidden links" do
	let(:user) {FactoryGirl.create(:user)}
	let(:admin) {FactoryGirl.create(:admin_user)}
	let!(:post) do
  		post = FactoryGirl.create(:post, name:"Pierde Muchos Fondos")
  		post.update(user: admin)
  		post
	end

	

	context "anonymous users" do
		scenario "cannot see the New Post Link" do
			visit posts_path
			assert_no_link_for "Nuevo Blog Post"
		end

		scenario "cannot see the New Project Link" do
			visit posts_path
			assert_no_link_for "Nuevo Proyecto"
		end

		scenario "cannot see the Edit Post Link" do
			visit post_path(post)
			assert_no_link_for "Edit Post"
		end

		
	end

	context "regular users" do
		before { log_in!(user) }
		scenario "can see the New Post Link" do
			visit posts_path
			assert_link_for "Nuevo Blog Post"
		end

		scenario "cannot see the Edit Post Link" do
			visit post_path(post)
			assert_link_for "Edit Post"
		end

		scenario "cannot see the Edit Post Link" do
			visit post_path(post)
			assert_link_for "Delete Post"
		end

	end

	context "admin users" do
		before { log_in_as!(admin) }
		scenario "can see the New Post Link" do
			visit posts_path
			assert_link_for "Nuevo Blog Post"
		end

		scenario "can see the Edit Post Link" do
			
			visit post_path(post)
			assert_link_for "Edit Post"
		end

		scenario "can see the Edit Post Link" do
			visit post_path(post)
			assert_link_for "Delete Post"
		end

		
	end


end