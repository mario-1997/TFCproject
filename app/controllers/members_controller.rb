class MembersController < ApplicationController

    def index
        #@members =  Member.all
        @members = ::Members::Search.new.execute
    end

    def new
        @member = Member.new
        @groups = Group.all
    end

    def create   #guardo en la base de datos y redirijo donde quiera  (Esto no tiene vista)
        @member = Members::Create.new(member_params: member_params).execute  #guardamos en esta variable los parametros necesarios para ceracion de un grupo 
        if(@member.save)  #si el grupo ya está creado me redirijo a gruppos
            redirect_to members_path
        else 
            render :new , notice: 'No se ha podido crear ningun grupo'#si no está creado voy a new y lo creo
        end
    end

    def destroy
        member = Member.find(params[:id])  #guardamos el id de un grupo en la variable group
        ::Members::Destroy.new(id: params[:id]).execute #borramos el grupo con el id guardado en la variable 'params'
        redirect_to members_path  #borramos el grupo y nos redirije a la ruta de grupos

    end

    def show
        @member = Members::Find.new(id: params[:id]).execute
    end


    def edit
        @member = Member.find(params[:id])
        @groups = Group.all
    end

    def update
        @member = Member.find(params[:id])
        if @member.update(member_params)
            redirect_to members_path
        else 
            render :edit
        end
        
    end

    private
    def member_params
        params.require(:member).permit(:name, :surname, :ocupation, :dni, :group_id)  #parametros requeridos para la creacion de un grupo nuevo
    end

end
