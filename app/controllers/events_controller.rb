# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index

    
    if params[:time] == "week"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago.utc..7.days.from_now} 
    elsif params[:time] == "tomorrow"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago.utc..Date.tomorrow.tomorrow}
    elsif params[:time] == "month"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago.utc..30.days.from_now}
    else
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago.utc..Date.tomorrow}
    end

    find_topics(@events)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def search
    if params[:time] == "week"
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => 1.hour.ago.utc..7.days.from_now} 
    elsif params[:time] == "tomorrow"
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => 1.hour.ago.utc..Date.tomorrow.tomorrow}
    elsif params[:time] == "month"
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => 1.hour.ago.utc..30.days.from_now}
    else
      @events = Event.search params[:q], :match_mode => :any, :with => {:date => 1.hour.ago.utc..Date.tomorrow}
    end
    find_topics(@events)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    @related_events = Event.search @event.keywords, :match_mode => :any, :with => {:date => 1.hour.ago.utc..30.days.from_now}
    @related_events.delete(@event)

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
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

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




end
