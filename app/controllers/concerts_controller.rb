class ConcertsController < ApplicationController
    
    def index
        @concerts =  Concert.all
    end

    def new
        @concert = Concert.new
        @groups = Group.all
    end

    def create   #guardo en la base de datos y redirijo donde quiera  (Esto no tiene vista)
        @concert = Concert.new(concert_params)  #guardamos en esta variable los parametros necesarios para ceracion de un grupo 
        if(@concert.save)  #si el grupo ya está creado me redirijo a gruppos
            redirect_to @concert 
        else 
            render :new #si no está creado voy a new y lo creo
        end
    end

    def destroy
        concert = Concert.find(params[:id])  #guardamos el id de un grupo en la variable group
        concert.destroy  #borramos el grupo con el id guardado en la variable 'params'
        redirect_to concerts_path  #borramos el grupo y nos redirije a la ruta de grupos

    end

    def show
        @concert = Concert.find(params[:id])
    end


    def edit
        @concert = Concert.find(params[:id])
        @groups = Group.all
    end

    def update
        @concert = Concert.find(params[:id])
        if @concert.update(concert_params)
            redirect_to concerts_path
        else 
            render :edit
        end
        
    end










    private
    def concert_params
        params.require(:concert).permit(:place, :concert_date, :group_id)  #parametros requeridos para la creacion de un grupo nuevo
    end


end
