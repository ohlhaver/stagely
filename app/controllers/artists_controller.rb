class ArtistsController < InheritedResources::Base
	def show
    @artist = Artist.find(params[:id])


    @genre_breadcrumb = @artist.subgenre.genre.name
    @subgenre_breadcrumb = @artist.subgenre.name

    #Shortener::ShortenedUrl.generate(request.url)
    #@keywords = @event.keywords.split(/\s+/)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end
end
