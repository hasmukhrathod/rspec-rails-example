RSpec.describe "Home page", type: :request do
    context "render home page" do
        let(:post) {create(:post)}
        
        before do
            post.published!
        end
        
        it "renders home page" do
          get '/'
          expect(response).to render_template(:index)
          expect(response.body).to include("Home")
        end
        
        it "renders home page with posts" do
            get '/'
            expect(response).to render_template(:index)
            expect(response.body).to include(post.title)
        end
    end
end