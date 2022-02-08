class TransacsController < ApplicationController
  before_action :set_transac, only: %i[ show edit update destroy ]

  # GET /transacs or /transacs.json
  def index
    @transacs = Transac.all
  end

  # GET /transacs/1 or /transacs/1.json
  def show
  end

  # GET /transacs/new
  def new
    @transac = Transac.new
    @categories = Category.where(user: current_user)
  end

  # GET /transacs/1/edit
  def edit
  end

  # POST /transacs or /transacs.json
  def create
    @transac = Transac.new(transac_params)
    @transac.user = current_user
    @transac.save
    unless params[:categories].blank?
      params[:categories].each do |k,v|
        CategoryTransac.create(category: Category.find(k), transac: @transac)
      end
    end
    respond_to do |format|
      if @transac.persisted?
        if @transac.categories.blank?
          @transac.destroy
          format.html { redirect_to new_transac_path, alert: "Transaction must have at least one category." }
        else 
          format.html { redirect_to category_url(@transac.categories.first), notice: "Transaction was successfully created." }
        end
      else
        format.html { redirect_to new_transac_path, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transacs/1 or /transacs/1.json
  def destroy
    @transac.destroy

    respond_to do |format|
      format.html { redirect_to transacs_url, notice: "Transac was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transac
      @transac = Transac.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transac_params
      params.require(:transac).permit(:name, :amount)
    end
end
