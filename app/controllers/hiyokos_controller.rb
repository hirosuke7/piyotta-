class HiyokosController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}


  def index
    @hiyokos = Hiyoko.all
  end

  def show
    @hiyoko = Hiyoko.find(params[:id])
  end

  def new
    @hiyoko = Hiyoko.new
  end

  def create
    @hiyoko = Hiyoko.new(
      name:params[:name],
      email: params[:email],
      image_name: "default_hiyoko1.jpg",
      password: params[:password]
    )
    if @hiyoko.save
      session[:user_id] = @hiyoko.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/hiyokos/#{@hiyoko.id}")
    else
      render("hiyokos/new")
    end
  end

  def edit
    @hiyoko = Hiyoko.find(params[:id])
  end

  def update
    @hiyoko = Hiyoko.find(params[:id])
    @hiyoko.name = params[:name]
    @hiyoko.email = params[:email]
    if params[:image]
      @hiyoko.image_name = "#{@hiyoko.id}.jpg"
      image = params[:image]
      File.binwrite("public/hiyoko_images/#{@hiyoko.image_name}", image.read)
    end
    if @hiyoko.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/hiyokos/#{@hiyoko.id}")
    else
      render("hiyokos/edit")
    end
  end

  def destroy
    @hiyoko = Hiyoko.find(params[:id])
    @hiyoko.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/ hiyokos/index")
  end

  def login_form
  end

  def login
    @hiyoko = Hiyoko.find_by(email: params[:email], password: params[:password])
    if @hiyoko
      session[:user_id] = @hiyoko.id
      flash[:notice] = "ログインしました"
      redirect_to posts_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("hiyokos/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end


  def likes
    @hiyoko = Hiyoko.find(params[:id])
    @likes = Like.where(user_id: @hiyoko.id)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
