class API < Grape::API
  
  prefix 'api'

  resource "posts" do
    get do
      Post.all
    end

    get ':id' do
      Post.where(url: params[:id]).first
    end
  end

end