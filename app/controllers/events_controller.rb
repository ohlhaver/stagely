# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :new, :create, :destroy, :attend, :consider]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index

    
    if params[:time] == "week"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..7.days.from_now} 
    elsif params[:time] == "tomorrow"
      @events = Event.search :match_mode => :fullscan, :with => {:date => Time.zone.parse(Date.tomorrow.to_s(:db))..Time.zone.parse(Date.tomorrow.tomorrow.to_s(:db))}
    elsif params[:time] == "month"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..30.days.from_now}
    else
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..Time.zone.parse(Date.tomorrow.to_s(:db))}
    end


    find_topics(@events)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def search
    if params[:time] == "week"
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => 1.hour.ago..7.days.from_now} 
    elsif params[:time] == "tomorrow"
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => Time.zone.parse(Date.tomorrow.to_s(:db))..Time.zone.parse(Date.tomorrow.tomorrow.to_s(:db))}
    elsif params[:time] == "month"
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => 1.hour.ago..30.days.from_now}
    else
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => 1.hour.ago..Time.zone.parse(Date.tomorrow.to_s(:db))}
    end
    find_topics(@events)
    @search_breadcrumb = params[:q]
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    @related_events = Event.search @event.artist.subgenre.name, :match_mode => :any, :with => {:date => 1.hour.ago..30.days.from_now}, :limit => 9
    @related_events.delete(@event)
    #@time_breadcrumb = 
    #@town_breadcrumb = @event.venue.town
    @time_breadcrumb = event_time
    @genre_breadcrumb = @event.artist.subgenre.genre.name
    @subgenre_breadcrumb = @event.artist.subgenre.name

    #Shortener::ShortenedUrl.generate(request.url)
    #@keywords = @event.keywords.split(/\s+/)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @action_breadcrumb = "Post a concert"
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @action_breadcrumb = "Edit event"
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end


  def event_time
     if @event.date > 1.hour.ago && @event.date < Time.zone.parse(Date.tomorrow.to_s(:db))
      return "Today"
    elsif @event.date > Time.zone.parse(Date.today.to_s(:db)) && @event.date < Time.zone.parse(Date.tomorrow.tomorrow.to_s(:db))
      return "Tomorrow"
    elsif @event.date > Time.zone.parse(Date.tomorrow.to_s(:db)) && @event.date < 7.days.from_now
      return "This week"
    elsif @event.date > 7.days.from_now && @event.date < 30.days.from_now
      return "This month"
    end
  end

  def filter_time
    if params[:time] == "today"
      return "Today"
    elsif params[:time] == "tomorrow"
      return "Tomorrow"
    elsif params[:time] == "week"
      return "This week"
    elsif params[:time] == "month"
      return "This month"
    end
  end

  def correct_user
    @event =Event.find(params[:id])
    redirect_to root_url if current_user != @event.user
  end

  def attend
        event_id = params[:event_id]
        event = Event.find(event_id)
        event_url = params[:event_url]
        type = params[:type]
        
        auth = session[:auth]
        token = auth["credentials"]["token"]
        me = FbGraph::User.me(token)
        if type == "attend"
          me.feed!(
            :message => 'will attend "' + event.artist.name + '" ' + event_url

          )
        else
          me.feed!(
            :message => 'considers attending "' + event.artist.name + '" ' + event_url
          )
        end

        redirect_to (event || root_url)
  end

  




end
