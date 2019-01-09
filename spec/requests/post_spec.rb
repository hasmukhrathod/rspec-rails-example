require 'rails_helper'

RSpec.describe "post page", type: :request do
  context "render post page" do 
    let(:post) {create(:post)}
    it "renders post page with a slug   " do
      get "/posts/#{post.slug}"
      expect(response).to render_template(:show)
      expect(response.body).to include(post.title)
    end
  end
  context "create a new post page" do
    let(:user) {create(:user)}
    it "loads a new post page when "
    it "does not load a new page when not authentiated" do
      get '/posts/new'
      expect(response).to redirect_to new_user_session_path
    end
  end
  
  context "new post" do
    let(:user) {create(:user)}
    let(:post_attributes) {attributes_for(:post)}
    
    it "createa a new post when authenticated" do
      sign_in(user)    
      get '/posts/new'
      expect(response).to render_template(:new)
      expect(response.body).to include('New Post')
      post '/posts', params: {post: post_attributes}
      expect(response).to redirect_to(assigns(:post))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include(post_attributes[:title])
    end
  end
end
