class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    find_topics(@events)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def search
    @events = Event.search params[:q], :match_mode => :any
    find_topics(@events)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    @related_events = Event.search @event.keywords, :match_mode => :any

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

  def find_topics(events)
    all_keywords =""
      events.each do |e|
        (all_keywords = all_keywords + e.keywords) 
      end

      all_keywords_array = all_keywords.split(/\s+/)
      keywords_with_values = all_keywords_array.inject(Hash.new(0)) {|h,x| h[x]+=1;h}
      ranked_array = keywords_with_values.sort_by { |key, value| -value }
      words =[]
      ranked_array.first(5).each do |f|
        words = words.push(f[0])
      end
      @words=words
  end



end
