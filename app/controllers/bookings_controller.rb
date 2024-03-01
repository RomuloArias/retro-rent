class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings.sort_by(&:updated_at).reverse
  end

  def show
    @booking = Booking.find(params[:id])
    @game = @booking.game
  end

  def new
    @booking = Booking.new
    @game = Game.find(params[:game_id])
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @game = Game.find(params[:game_id])
    @booking.game = @game
    @booking_duration = (@booking.end_date-@booking.start_date).to_i
    @booking.total_price = @booking_duration*@game.price_per_day

    if @booking.save
      redirect_to bookings_path, notice: 'retro-rent-booking was successful!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to bookings_path, notice: 'Updated successfully'
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Updated successfully'
  end

  private

  def booking_params
      params.require(:booking).permit(:start_date, :end_date)
  end

end
