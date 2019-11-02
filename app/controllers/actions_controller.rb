class ActionsController < ApplicationController
    def index
        @client = Client.find(params[:client_id])
        @actions = Action.all.where(client_id: params[:client_id])
        if @client.nil? || @actions.nil?
            logger.debug "nilだよー"
            flash[:error] = "このクライアントには何もアクションしていません"
        end
    end

    def new
        @client = Client.find(params[:client_id])
        @action = @client.actions.new
        # binding.pry

    end

    def edit
        @client = Client.find(params[:client_id])
        @actions = Client.find(params[:client_id]).actions.find(params[:id])
    end

    def create
        @client = Client.find(params[:client_id])
        @action = @client.actions.new(set_action_params(params))
        if @action.save
            redirect_to client_actions_path(@client)
        else
            flash[:error] = "something is wrong"
            render "new"
        end
    end

    def update
        @action = Action.find(params[:id])
        if @action.update(set_action_params(params))
            redirect_to client_actions_path
        else
          # エラーの内容ってどうやって取り出す？   
          flash[:error] = "error has occurred"
          redirect_to edit_client_action_path
        end

    end
    def destroy
        @client = Client.find(params[:client_id])
        @action = Client.find(params[:client_id]).actions.find(params[:id])
        if @action.delete
            redirect_to client_actions_path(@client, @action)
        else
        end
    end

    def set_action_params(params)
        params.require(:actions).permit(:content, :state, :expectation)

    end
end
