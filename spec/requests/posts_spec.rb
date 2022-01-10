require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "POST /posts" do
    before(:all) do
      @post_count = Post.count
      @new_user = create(:user,email: "newuser@test.com", username: "Newuser")
    end

    context "with token" do
      before(:each) do
        token = JwtServices.encode(@new_user)
        post "/posts", header: {Authorization: "Bearer #{token}"},params: {park_id: 1, comment: "I love this park", user_id: 1}
      end

      it "should respond with 201 created" do
        expect(response).to have_http_status(201)
      end  

      it "should increase post count by 1" do
        expect(Post.count).to be @post_count +1  
      end

      it "should contain the post content" do
        expect(response.body).to include("I love this park")
        expect(response.body).to include("Newuser")
      end
    end

end
