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
    if @infolist.save
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
  end

  def show
    # @list = List.find(params[:id])
    @infolist = Infolist.find(params[:id])
  end

  def edit
    # @list = List.find(params[:id])
    @infolist = Infolist.find(params[:id])
  end

  # def update
  #   infolist = Infolist.find(params[:id])
  #   infolist.update(infolist_params)
  #   redirect_to infolist_path(infolist.id)
  # end

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
