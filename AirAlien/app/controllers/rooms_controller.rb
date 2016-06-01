class RoomsController < ApplicationController
  before_action :set_room, only: [:show,:edit,:update] #run set_room before_action in show,edit,update in this controller
  before_action :authenticate_user!, except: [:show] #need login before doing except :show, want anyone to see listinghome
  def index
    @rooms = current_user.rooms
  end

  def show #use set_room
    @photos=@room.photos #show photo of rooms
  end

  def edit #use set_room
    if current_user.id == @room.user.id #add logic to prevent other from edit your room
    @photos=@room.photos
    else
      redirect_to root_paht ,notice: "You are not authorize to access this information"
    end
  end

  def new
    @room= current_user.rooms.build
  end

  def create
    @room= current_user.rooms.build(room_params)
    if @room.save
      if params[:image]
        params[:image].each.do |image|
         @room.photos.create[image: image]
        end
      end
      @photos=@room.photos
      redirect_to edit_rooms_path(@room) notice:"Saved.."
    else
      render :new
    end
  end
  
  def update #use set_room
    if @room.update(room_params)
      if params[:image]
        params[:image].each.do |image|
         @room.photos.create[image: image]
        end
      end
      redirect_to notice:"Updated.."
    else
      render :new
    end
  end
  
  private
    def set_room
      @room = Room.find(params[:id])
    end
  
    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodation, :bed_room,:bath_room,:listing_name,:summary ,:address,:is_tv,:is_kitchen,:is_air,:is_heating,:is_internet,:pricing,:active)
    end  
end

