class AffiliationsController < ApplicationController
    # beforeアクションでget_client_id的なのが必要？ そうじゃないとランダムに消せるようになってしまわない?
    def index
        @client = Client.find(params[:client_id])
        @affiliations= @client.affiliations
    end

    def new
        @client = Client.find(params[:client_id])
        @affiliation = @client.affiliations.new
    end

    def create
        @client = Client.find(params[:client_id])
        @affiliation = @client.affiliations.new(affiliation_params(params))
        if @affiliation.save
            redirect_to client_affiliations_path(@client)
        else
            flash[:error] = 'Errorだよ'
            # redirect_to new_client_affiliation_path
            # render "new", {affiliation: @affiliation}
            render "new"
        end
    end

    def edit
        @client = Client.find(params[:client_id])
        @affiliation = Affiliation.find(params[:id]) if params[:aff].nil?

    end

    def update
        @client = Client.find(params[:client_id])
        @affiliation = Affiliation.find(params[:id])
        if @affiliation.update(affiliation_params(params))
            redirect_to client_affiliations_path(client_id: params[:client_id]), success: 'Item was successfully updated.'
        else
            params[:aff] = @affiliation
            flash[:error] = "Failed to update"
            # render "edit"
            # redirect_to edit_client_affiliation_path(id: params[:id]), error: 'Failed to update2.', affiliation: @affiliation
            redirect_to edit_client_affiliation_url(id: params[:id]), error: 'Failed to update2.'
        end
    end

    def destroy
      @affiliation = Client.find(params[:client_id]).affiliations.find(params[:id])
      if @affiliation.destroy
        flash[:success] = "Destroyed successfully"
        redirect_to root_path
      else
        flash[:error] = "Failed to destroy"
        redirect_to :root
      end


    end

    def show
        @affiliation = Client.find(params[:client_id]).affiliations.find(params[:id])
    end

    def affiliation_params(params)
        params.require(:affiliation).permit(:name, :address, :call, :email, :memo)
    end
end
