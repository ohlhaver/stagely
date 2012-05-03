class ArtistsController < InheritedResources::Base
  before_filter :authorize, only: [:edit, :update, :new, :create, :destroy]
  before_filter :power_user, only: [ :edit, :update, :destroy]
	def show
    @artist = Artist.find(params[:id])


    @genre_breadcrumb = @artist.subgenre.genre.name
    @subgenre_breadcrumb = @artist.subgenre.name

    @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..365.days.from_now, :artist_id => @artist.id}, :order => "date ASC" 

    #Shortener::ShortenedUrl.generate(request.url)
    #@keywords = @event.keywords.split(/\s+/)
    @related_events = Event.search find_topics(@events), :match_mode => :any, :with => {:date => 1.hour.ago..30.days.from_now} unless @events == nil
    @events.each do |e|
      @related_events.delete(e)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end
end
