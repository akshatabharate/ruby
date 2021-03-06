class PostsController < ApplicationController
  
    #   http_basic_authenticate_with  name: "akshata", password:"12345", except: [:index, :show,:search]
    before_action :authenticate_user!, except: [:show, :index, :search]
    def show
        @post = Post.find(params[:id])
        @categories = Category.all
    end

    def index
        @categories = Category.all

        cate = params[:cate]

        if !cate.nil?
            @posts=Post.where(:category_id => cate)
        else

            @posts=Post.all
        # @posts = Post.all.order("created_at DESC")
        #  @latest_post = @posts.first
        #  @posts = Post.where("concat_wc(' ' , posts.title, posts.body) LIKE ?", "%#{search}%")   
        end
    end
    def test

    end
   

   
    def new
        @post=Post.new
        
    end

    def create
        #render plain: params[:post].inspect
        @post = Post.new(post_params)
        @post.user = current_user
       if(@post.save)
            redirect_to @post
       else
        render 'new'
       end
    end

    def edit
       
        @post = Post.find(params[:id])
    end    


    def update
        @post = Post.find(params[:id])
        if(@post.update(post_params))
            redirect_to @post
       else
        render 'edit'
       end
    end
    def search
        @query =params[:query]
         @posts=Post.where("posts.title LIKE?",["%#{@query}%"])
        #  @posts = Post.search "posts"
        #  @posta.each do |post|
        #    puts post.title
        #  end
    end


    def upvote
        @post = Post.find(params[:id])
        @post.upvote_by current_user
        redirect_to :back
      end


    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private def post_params
        params.require(:post).permit(:title, :body, :category_id)
    end
end
