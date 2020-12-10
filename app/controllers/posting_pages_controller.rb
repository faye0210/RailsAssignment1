class PostingPagesController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]
  def index
    @posting_page = PostingPage.all
  end
  def new
    @posting_page = PostingPage.new
  end
  def create
    @posting_page = PostingPage.new(posting_params)
    if params[:back]
      render :new
    else
      if @posting_page.save
        redirect_to posting_pages_path, notice: "ツイートしました！"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @posting_page.update(posting_params)
      redirect_to posting_pages_path, notice: "ツイートを編集しました"
    else
      render :edit
    end
  end
  def destroy
    @posting_page.destroy
    redirect_to posting_pages_path, notice: "ツイートを削除しました"
  end
  def confirm
    @posting_page = PostingPage.new(posting_params)
    render :new if @posting_page.invalid?
  end
  private
  def posting_params
    params.require(:posting_page).permit(:content)
  end
  def set_posting
    @posting_page = PostingPage.find(params[:id])
  end
end
