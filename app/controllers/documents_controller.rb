class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
    authorize! :read, @document
  end

  def new
    @document = Document.new
    authorize! :create, @document
  end

  def edit
    @document = Document.find(params[:id])
    authorize! :edit, @document
  end

  def update
    authorize! :update, @document
    @document = Document.find(params[:id])
    if params[:document]
      @document.update(documents_params)
    end
      redirect_to document_path
  end

  def create
    @document = Document.new(documents_params)
    authorize! :create, @document
    if @document.save
      flash[:notice] = "Document created!"
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def destroy
    @document = Document.find(params[:id])
    authorize! :destroy, @document
    @document.destroy
    redirect_to(root_path)

  end

private

  def documents_params
    params.require(:document).permit(:title, :body, :user_id, :security_level)
  end
end
