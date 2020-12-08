class InfolistsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  def new
    # @list = List.new
    @infolist = Infolist.new
  end

  # def create
  #   # １. データを新規登録するためのインスタンス作成
  #   @infolist = Infolist.new(infolist_params)
  #   # ２. データをデータベースに保存するためのsaveメソッド実行
  #   @infolist.save
  #   # ３. トップ画面へリダイレクト
  #   redirect_to infolists_path(id: current_user)
  # end
  def create
    @infolist = Infolist.new(infolist_params)
    @infolist.user_id = current_user.id
    @infolist.score = Language.get_data(infolist_params[:body])  #この行を追加 上から実行（保存する前に実行）


    if @infolist.save

    tags = Vision.get_image_data(@infolist.image)
    tags.each do |tag|
      @infolist.tags.create(name: tag)
    end
    
      redirect_to infolist_path(@infolist), notice: "投稿しました！"
    else
      @infolists = Infolist.all
      render 'index'
    end
    
  end

  def index
    # @lists = List.all
    @infolists = Infolist.all
    @infolist = Infolist.new
    @all_ranks = Infolist.find(Like.group(:infolist_id).order('count(infolist_id) desc').limit(5).pluck(:infolist_id))
  end

  def show
    # @list = List.find(params[:id])
    @infolist = Infolist.find(params[:id])
    @like = Like.new
  end

  def edit
    # @list = List.find(params[:id])
    @infolist = Infolist.find(params[:id])
  end



  def update
    @infolist = Infolist.find params[:id]
    if @infolist.update(infolist_params)
      redirect_to infolist_path(@infolist), notice: "更新しました！"
    else
      render "edit"
    end
  end



  def destroy
    @infolist = Infolist.find(params[:id])  # データ（レコード）を1件取得
    @infolist.destroy  # データ（レコード）を削除
    redirect_to infolists_path  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def infolist_params
    params.require(:infolist).permit(:title, :body, :image)
  end

end
