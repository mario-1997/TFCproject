class AlbumsController < ApplicationController

    def index
        @albums = ::Albums::Search.new.execute 
    end

    def new
        @album = Album.new
        @groups = Group.all 
    end

    def create   #guardo en la base de datos y redirijo donde quiera  (Esto no tiene vista)
        @album = Albums::Create.new(album_params: album_params).execute  #guardamos en esta variable los parametros necesarios para ceracion de un grupo 
        if(@album.save)  #si el grupo ya está creado me redirijo a gruppos
            redirect_to albums_path
        else 
            render :new #si no está creado voy a new y lo creo
        end
    end

    def show
        @album= ::Albums::Find.new(id: params[:id]).execute
    end

    def edit
        @album = Album.find(params[:id])
        @groups = Group.all
    end

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            redirect_to albums_path
        else 
            render :edit
        end
        
    end

    def destroy
        album = Album.find(params[:id])
        if album.songs.count > 0 
            
            redirect_to albums_path, notice: 'No se ha podido eliminar ningun album'
        else
           
            ::Albums::Destroy.new(id: params[:id]).execute
            redirect_to albums_path
        end
    end





    private
    def album_params
        params.require(:album).permit(:name, :musical_style, :publication_date, :group_id)  #parametros requeridos para la creacion de un grupo nuevo
    end


end
