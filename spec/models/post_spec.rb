require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe "post validations" do
    context "basic validations" do
      let(:post) {build(:post, title: nil, body: nil)}
      it { should_not be_valid }
      it { should_not be_valid }
    end
    context "email format validations" do
      it { should allow_value(Faker::Internet.email).for(:email) }
      it { should_not allow_value("abhc###asfdd").for(:email) }
    end
  end
  describe 'ActiveRecord Callbacks' do
    let(:post) { build_stubbed(:post) }

    it "should generate and save a slug on create" do
      post.run_callbacks :create
      expect(post.slug).not_to be_empty
    end
  end
  
  describe "class method test" do
    let(:post) {create(:post)}
    describe ".posts_by_email" do
      it "should respond to class method" do
        expect(post.class).to respond_to(:posts_by_email)
      end
    end
    context 'executes class method correctly' do
        it '.posts_by_email returns all posts by an email' do
          posts = Post.posts_by_email(post.email)
          expect(posts.first).to eq post
        end
    end
  end
  
  describe "Test instance method" do
    let(:post) {build(:post)}
    it "#truncated_post should truncate the post" do
      short_post = post.truncated_post
      expect(short_post.length).to eq(25)
    end
  end
  
  describe "Active Record associations" do
    let(:post) {create(:post)}
    let(:comment) {create(:comment, post: post)}
    
    it "should have many comments" do
      expect(post).to have_many(:comments)
    end
  end
  
  
  describe "enum testing" do
    3.times.each do |count|
      #The difference between let, and let! is that let! is called in an implicit before block. 
      #So the result is evaluated and cached before the it block.
      let!("post_#{count + 1}".to_sym) { create(:post) }
    end

    before do
      post_1.published!
      post_3.published!
    end

    it '.published returns all the published posts' do
      expect(Post.published.count).to eq 2
    end

    it '.draft returns all draft posts' do
      expect(Post.draft.count).to eq 1
    end
  end
end
