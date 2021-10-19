class GroupsController < ApplicationController

    def index  #metodo para enseñar todos los grupos que tengo en mi BD
        #@groups = Group.all #del modelo de grupos me coje todos los grupos (.all)
        @groups = ::Groups::Search.new.execute
    end

    def new #metodo para definir un nuevo grupo
        @group = Group.new  #definicion de un nuevo grupo, aqui accedo al formulario para crear un nuevo grupo
    end

    def create   #guardo en la base de datos y redirijo donde quiera  (Esto no tiene vista)
        @group = Group.new(group_params)  #guardamos en esta variable los parametros necesarios para ceracion de un grupo 
        if(@group.save)  #si el grupo ya está creado me redirijo a gruppos
            redirect_to @group 
        else 
            render :new #si no está creado voy a new y lo creo
        end
    end


    def show  #metodo para mostrar un solo grupo ----->  (el metodo all me muestra todos los grupos)
        @group = Group.find(params[:id]) #solo cogemos el id del array params
        #p "****************"
       #p @group
    end

    def destroy
        p "**************************************************************************************"
        @group = ::Groups::Destroy.new(id: params[:id]).execute
        redirect_to groups_path
        
    end
    

    def edit
        @group = Group.find(params[:id])  #buscamos el id del grupo que queremos actualizar
    end

    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
            redirect_to groups_path
        else 
            render :edit
        end
        
    end






    private
    def group_params
        params.require(:group).permit(:name, :musical_style)  #parametros requeridos para la creacion de un grupo nuevo
    end


end