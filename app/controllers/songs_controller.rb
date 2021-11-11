class SongsController < ApplicationController

    def index
        @songs = ::Songs::Search.new.execute
    end

    def new
        @song = Song.new
        @albums = Album.all
    end

    def create   #guardo en la base de datos y redirijo donde quiera  (Esto no tiene vista)
        @song = Songs::Create.new(song_params: song_params).execute  #guardamos en esta variable los parametros necesarios para ceracion de un grupo 
        if(@song.save)  #si el grupo ya está creado me redirijo a gruppos
            redirect_to songs_path
        else 
            render :new #si no está creado voy a new y lo creo
        end
    end


    def show
        @song = ::Songs::Find.new(id: params[:id]).execute
    end

    def edit
        @song = Song.find(params[:id])
        @albums = Album.all  
    end

    def update 
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to songs_path
        else 
            render :edit
        end
    end

    def destroy 
        song  = Song.find(params[:id])
        ::Songs::Destroy.new(id: params[:id]).execute
        redirect_to songs_path

    end




    private
    def song_params
        params.require(:song).permit(:name, :publication_date, :album_id)  #parametros requeridos para la creacion de un grupo nuevo
    end


end
