class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy,]
 # pictureの投稿・投稿確認・編集・一覧表示・詳細画面・削除機能があること（CRUD機能）
  def index
    @feeds = Feed.all
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def create
    @feed = current_album.feeds.build(feed_params)
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: '正常に行われました' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def confirm
    @feed = current_album.feeds.build(feed_params)
    render :new if @feed.invalid?
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'アップデートされました' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: '正しく削除されました' }
    end
  end

  private
  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:image, :image_cache, :content)
  end
end
