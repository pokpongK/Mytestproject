class RoomsController < ApplicationController
  before_action :set_room, only: [:show,:edit,:update] #run set_room before_action in show,edit,update in this controller
  before_action :authenticate_user!, except: [:show] #need login before doing except :show, want anyone to see listinghome
  def index
    @rooms = current_user.rooms
  end

  def show #use set_room
  end

  def edit #use set_room
  end

  def new
    @room= current_user.rooms.build
  end

  def create
    @room= current_user.rooms.build(room_params)
    if @room.save
      redirect_to notice:"Saved.."
    else
      render :new
    end
  end
  
  def update #use set_room
    if @room.update(room_params)
      redirect_to notice:"Update.."
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

