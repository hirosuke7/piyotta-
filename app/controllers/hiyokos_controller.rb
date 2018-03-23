class HiyokosController < ApplicationController

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
    @hiyoko = Hiyoko.new(name:params[:name],email: params[:email],image_name: "default_hiyoko.jpg")
    if @hiyoko.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/hiyokos/#{@hiyoko.id}")
    else
      render("hiyokos/new")
    end
  end

  def edit
    @hiyoko = Hiyoko.find(params[:id])
  end

  # updateアクションを作成してください
  def update
    @hiyoko = Hiyoko.find(params[:id])
    @hiyoko.name = params[:name]
    @hiyoko.email = params[:email]
    @hiyoko.image_name = "#{@hiyoko.id}.jpg"
    File.binwrite("public/hiyoko_images/#{@hiyoko.image_name}", image.read)

    if @hiyoko.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/hiyokos/#{@hiyoko.id}")
    else
      render("hiyokos/edit")
    end
  end

end
