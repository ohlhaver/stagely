class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

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

    @event.keywords = generate_keywords(@event.description)

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
    @event.keywords = generate_keywords(@event.description)

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

  def generate_keywords(description)
    text= description

    text = text.gsub(/\W/, ' ')

    array = text.split(/\s+/)

    array = array.collect {|e| e.downcase if e != nil}

    position = array.inject(Hash.new(0)) {|h,x| h[x]+=1;h}
    position.delete_if {|key, value| key == nil}

    keywords = (position.keys).join(' ')
                 
    keywords = ' ' + keywords + ' '

      if keywords != nil
                
        #keywords=keywords.sub('—',' ')
        
        keywords=keywords.sub(' jan ',' ')
        keywords=keywords.sub(' feb ',' ')
        keywords=keywords.sub(' mar ',' ')
        keywords=keywords.sub(' apr ',' ')
        keywords=keywords.sub(' may ',' ')
        keywords=keywords.sub(' jun ',' ')
        keywords=keywords.sub(' jul ',' ')
        keywords=keywords.sub(' aug ',' ')
        keywords=keywords.sub(' sep ',' ')
        keywords=keywords.sub(' oct ',' ')
        keywords=keywords.sub(' nov ',' ')
        keywords=keywords.sub(' dec ',' ')
        
        keywords=keywords.sub(' monday ',' ')
        keywords=keywords.sub(' tuesday ',' ')
        keywords=keywords.sub(' wednesday ',' ')
        keywords=keywords.sub(' thursday ',' ')
        keywords=keywords.sub(' friday ',' ')
        keywords=keywords.sub(' saturday ',' ')
        keywords=keywords.sub(' sunday ',' ')
           
        keywords=keywords.sub(' a ',' ')
        keywords=keywords.sub(' ap ',' ')
        keywords=keywords.sub(' about ',' ')
        keywords=keywords.sub(' an ',' ')
        keywords=keywords.sub(' am ',' ')
        keywords=keywords.sub(' and ',' ')
        keywords=keywords.sub(' are ',' ')
        keywords=keywords.sub(' at ',' ')
        keywords=keywords.sub(' as ',' ')
        keywords=keywords.sub(' be ',' ')
        keywords=keywords.sub(' but ',' ')
        keywords=keywords.sub(' by ',' ')
        keywords=keywords.sub(' can ',' ')
        keywords=keywords.sub(' do ',' ')
        keywords=keywords.sub(' does ',' ')
        keywords=keywords.sub(' for ',' ')
        keywords=keywords.sub(' from ',' ')
        keywords=keywords.sub(' got ',' ')
        keywords=keywords.sub(' has ',' ')
        keywords=keywords.sub(' have ',' ')
        keywords=keywords.sub(' he ',' ')
        keywords=keywords.sub(' her ',' ')
        keywords=keywords.sub(' him ',' ')
        keywords=keywords.sub(' if ',' ')
        keywords=keywords.sub(' ii ',' ')
        keywords=keywords.sub(' in ',' ')
        keywords=keywords.sub(' into ',' ')
        keywords=keywords.sub(' is ',' ')
        keywords=keywords.sub(' it ',' ')
        keywords=keywords.sub(' no ',' ')
        keywords=keywords.sub(' not ',' ')
        keywords=keywords.sub(' now ',' ')
        keywords=keywords.sub(' of ',' ')
        keywords=keywords.sub(' off ',' ')
        keywords=keywords.sub(' on ',' ')
        keywords=keywords.sub(' out ',' ')
        keywords=keywords.sub(' over ',' ')
        keywords=keywords.sub(' she ',' ')
        keywords=keywords.sub(' should ',' ')
        keywords=keywords.sub(' so ',' ')
        keywords=keywords.sub(' some ',' ')
        keywords=keywords.sub(' that ',' ')
        keywords=keywords.sub(' the ',' ')
        keywords=keywords.sub(' their ',' ')
        keywords=keywords.sub(' them ',' ')
        keywords=keywords.sub(' there ',' ')
        keywords=keywords.sub(' they ',' ')
        keywords=keywords.sub(' this ',' ')
        keywords=keywords.sub(' to ',' ')
        keywords=keywords.sub(' under ',' ')
        keywords=keywords.sub(' up ',' ')
        keywords=keywords.sub(' you ',' ')
        keywords=keywords.sub(' was ',' ')
        keywords=keywords.sub(' we ',' ')
        keywords=keywords.sub(' what ',' ')
        keywords=keywords.sub(' when ',' ')
        keywords=keywords.sub(' which ',' ')
        keywords=keywords.sub(' who ',' ')
        keywords=keywords.sub(' will ',' ')
        keywords=keywords.sub(' with ',' ')

        
        keywords=keywords.sub(' der ',' ')
        keywords=keywords.sub(' die ',' ')
        keywords=keywords.sub(' das ',' ')
        keywords=keywords.sub(' ein ',' ')
        keywords=keywords.sub(' eine ',' ')
        keywords=keywords.sub(' einer ',' ')
        keywords=keywords.sub(' sein ',' ')
        keywords=keywords.sub(' seine ',' ')
        keywords=keywords.sub(' ihr ',' ')
        keywords=keywords.sub(' ihre ',' ')
        keywords=keywords.sub(' auf ',' ')
        keywords=keywords.sub(' von ',' ')
        
        keywords=keywords.sub(' vom ',' ')
        keywords=keywords.sub(' zu ',' ')
        keywords=keywords.sub(' wegen ',' ')
        keywords=keywords.sub(' montag ',' ')
        keywords=keywords.sub(' dienstag ',' ')
        keywords=keywords.sub(' mittwoch ',' ')
        keywords=keywords.sub(' donnerstag ',' ')
           
        keywords=keywords.sub(' freitag ',' ')
        keywords=keywords.sub(' samstag ',' ')
        keywords=keywords.sub(' sonntag ',' ')
        keywords=keywords.sub(' hat ',' ')
        keywords=keywords.sub(' haben ',' ')
        keywords=keywords.sub(' hatte ',' ')
        keywords=keywords.sub(' hatten ',' ')
        keywords=keywords.sub(' wie ',' ')
        keywords=keywords.sub(' wo ',' ')
        keywords=keywords.sub(' wann ',' ')
        keywords=keywords.sub(' wer ',' ')
        keywords=keywords.sub(' wen ',' ')
        keywords=keywords.sub(' wenn ',' ')
        keywords=keywords.sub(' den ',' ')
        keywords=keywords.sub(' dieses ',' ')
        keywords=keywords.sub(' heute ',' ')
        keywords=keywords.sub(' nicht ',' ')
        keywords=keywords.sub(' noch ',' ')
        keywords=keywords.sub(' als ',' ')
        keywords=keywords.sub(' zum ',' ')
        keywords=keywords.sub(' nach ',' ')
        keywords=keywords.sub(' vor ',' ')
        keywords=keywords.sub(' sie ',' ')
        keywords=keywords.sub(' sei ',' ')
        keywords=keywords.sub(' so ',' ')
        keywords=keywords.sub(' werde ',' ')
        keywords=keywords.sub(' ist ',' ')
        keywords=keywords.sub(' in ',' ')
        keywords=keywords.sub(' es ',' ')
        keywords=keywords.sub(' sich ',' ')
        keywords=keywords.sub(' ob ',' ')
        keywords=keywords.sub(' sind ',' ')
        keywords=keywords.sub(' solche ',' ')
        keywords=keywords.sub(' wurde ',' ')
        keywords=keywords.sub(' dass ',' ')
        keywords=keywords.sub(' am ',' ')
        keywords=keywords.sub(' und ',' ')
        keywords=keywords.sub(' oder ',' ')
        keywords=keywords.sub(' an ',' ')
        keywords=keywords.sub(' einige ',' ')
        keywords=keywords.sub(' dann ',' ')
        keywords=keywords.sub(' wird ',' ')
        keywords=keywords.sub(' werden ',' ')
        keywords=keywords.sub(' gab ',' ')
        keywords=keywords.sub(' denn ',' ')
        keywords=keywords.sub(' da ',' ')
        keywords=keywords.sub(' des ',' ')
        keywords=keywords.sub(' bei ',' ')
        keywords=keywords.sub(' durch ',' ')
        keywords=keywords.sub(' unter ',' ')
        keywords=keywords.sub(' etwas ',' ')
        keywords=keywords.sub(' etwa ',' ')
        #keywords=keywords.sub(' über ',' ')
        keywords=keywords.sub(' was ',' ')
        keywords=keywords.sub(' warum ',' ')
        keywords=keywords.sub(' welche ',' ')
        keywords=keywords.sub(' welches ',' ')
        keywords=keywords.sub(' im ',' ')
        keywords=keywords.sub(' innerhalb ',' ')
        keywords=keywords.sub(' mit ',' ')
     
      end
    return keywords


  end




end
