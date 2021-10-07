class AlbumsController < ApplicationController

    def index
        @albums = Album.all 
    end

    def new
        @album = Album.new
        @groups = Group.all 
    end

    def create   #guardo en la base de datos y redirijo donde quiera  (Esto no tiene vista)
        @album = Album.new(album_params)  #guardamos en esta variable los parametros necesarios para ceracion de un grupo 
        if(@album.save)  #si el grupo ya está creado me redirijo a gruppos
            redirect_to @album 
        else 
            render :new #si no está creado voy a new y lo creo
        end
    end

    def show
        @album = Album.find(params[:id])
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





    private
    def album_params
        params.require(:album).permit(:name, :musical_style, :publication_date, :group_id)  #parametros requeridos para la creacion de un grupo nuevo
    end


end
