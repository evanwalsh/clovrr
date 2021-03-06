class API < Grape::API
  
  prefix 'api'

  resource "posts" do
    get do
      Post.all
    end

    get '/:id' do
      Post.where(url: params[:id]).first
    end
    
    post '/create' do
      @post = Post.new params[:post]
      @post.user = User.where(api_key: params[:api_key]).first
      if @post.save
        @post
      else
        nil
      end
    end
  end

end