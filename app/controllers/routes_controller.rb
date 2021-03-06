class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  # GET /routes
  # GET /routes.json
  
    
    def index

         if params[:search]
          @routes = Route.search(params[:search]).paginate(page: params[:page]) 
          else
          @routes = Route.all.paginate(page: params[:page])  
        end

     
       
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
    
  end

  def search
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(route_params)

    respond_to do |format|
      if @route.save
    flash[:success] = "Rota criada!" 
    format.html { redirect_to @route}
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json


  def update
    
    respond_to do |format|
      if @route.update(route_params)
        
              flash[:success] = "Rota atualizada!" 

          format.html { redirect_to @route }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /routes/1
  # DELETE /routes/1.json3
  def destroy
    @route.destroy
    respond_to do |format|
            flash[:success] = "Rota deletada!" 

      format.html { redirect_to routes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:origem, :destino, :data, :tipo, :obs, :pagamento, :frete)
    end
end
