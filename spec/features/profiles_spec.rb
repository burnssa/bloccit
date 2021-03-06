require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

	describe "Visiting profiles" do
 
	#include TestFactories

	before do 
		@user = create(:user)
		@post = create(:post, user: @user)
		@comment = create(:comment, user: @user)
		allow(@comment).to receive(:send_favorite_emails)
		@comment.save
	end

	describe "not signed in" do

		# it "shows profile" do
	 # 		visit user_path(@user)
	 # 		expect(current_path).to eq(user_path(@user))
	 # 		expect( page ).to have_content(@user.name)
	 # 		expect( page ).to have_content(@post.title)
	 # 		expect( page ).to have_content(@comment.body)
		# end
	end

	describe "signed in as admin user" do

		before do 
			# @user = authenticated_user(role: :admin)
			# @post = associated_post(user: @user)
			# comment_without_email(@user)
			login_as(@user, :scope => :user)
		end

		it "shows profile" do
	 		visit user_path(@user)
	 		expect(current_path).to eq(user_path(@user))
	 		expect( page ).to have_content(@user.name)
	 		expect( page ).to have_content(@post.title)
	 		expect( page ).to have_content(@comment.body)
		end
	end
end