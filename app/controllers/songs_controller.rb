class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    set_song!
  end

  def new
    @song = Song.new
  end

  def edit
    set_song!
  end

  def create
      @song = Song.new(song_params)
      if @song.valid?
        @song.save
        redirect_to song_path(@song)
      else
        render :new
      end
  end

  def update
    set_song!
    @song.assign_attributes(song_params)

      if @song.valid?
        @song.save
        redirect_to song_path(@song)
      else
        render :edit
      end
  end

  private

  def song_params
    params.require(:song).permit(:genre, :released, :title, :artist_name, :release_year)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end
