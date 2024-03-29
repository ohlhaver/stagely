# -*- encoding : utf-8 -*-
class VenuesController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :new, :create, :destroy]
  before_filter :power_user, only: [:edit, :update, :destroy]
  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all(:order =>'name ASC')


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show

    @venue = Venue.find(params[:id])

    if params[:time] == "week"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..7.days.from_now, :venue_id => @venue.id}, :order => "date ASC" 
    elsif params[:time] == "tomorrow"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..Time.zone.parse(Date.tomorrow.tomorrow.to_s(:db)), :venue_id => @venue.id}, :order => "date ASC" 
    elsif params[:time] == "today"
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..Time.zone.parse(Date.tomorrow.to_s(:db)), :venue_id => @venue.id}, :order => "date ASC" 
    else
      @events = Event.search :match_mode => :fullscan, :with => {:date => 1.hour.ago..30.days.from_now, :venue_id => @venue.id}, :order => "date ASC" 
      
    end

    @related_events = Event.search find_topics(@events), :match_mode => :any, :with => {:date => 1.hour.ago..30.days.from_now} unless @events == nil
    @events.each do |e|
      @related_events.delete(e)
    end
    @town_breadcrumb = @venue.town

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end



  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @action_breadcrumb = "Add venue"
    @venue = Venue.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @action_breadcrumb = "Edit venue" 
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = current_user.venues.build(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end


end
