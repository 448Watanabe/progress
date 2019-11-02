class ClientsController < ApplicationController
  before_action :authenticate_user!
  def index
    keyword=params[:keyword]
    if keyword.present?
      # キーワドを含む所属を検索 所属からクライアントIDを取得
      @clients = Client.joins(:affiliations).where("affiliations.name like ?", "%#{keyword}%").page(params[:page])
    else
      @clients = Client.all.page(params[:page])
    end
    
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(clients_params(params))
    if @client.save
      redirect_to @client
    else
      flash[:error] = 'Errorですよ'
      render "new"
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(clients_params(params))
        redirect_to @client
    else
      render "new"
    end
  end

  def destroy
    @client= Client.find(params[:id])
    if @client.destroy
      flash[:success] = "Destroyed successfully"
      redirect_to root_path
    else
      flash[:error] = "Failed to destroy"
      redirect_to :root
    end
  end

  def clients_params(params)
    params.require(:client).permit(:name, :email, :position)
  end
end
