class EventsController < ApplicationController
   
   def index
      @events = Event.all
   end
   
   def show
      @event = Event.find(params[:id]) # 是 用 id 还 是 用 event ?
   end
   
   def new
      @event = Event.new
   end
   
   def create
      @event = Event.new(event_params)
      if @event.save
         redirect_to events_path
         # redirect_to events_url
      else
         render :action => :new
      end
   end
   
   def edit
   end
   
   def update
      if @event.update_attributes(params[:event])
         redirect_to event_path(@event)
         # redirect_to event_url(@event)
      else
         render :action => :edit
      end
   end
   
   def destroy
      @event.destroy
      redirect_to events_path
   end
   
   def event_params
      params.required(:event).permit(:name,:age)
   end
   
end
