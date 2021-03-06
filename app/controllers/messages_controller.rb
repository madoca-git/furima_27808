class MessagesController < ApplicationController
  # def new
  #   @messages = Message.all
  #   @message = Message.new
  # end

  def show
    @messages = Message.all
    @message = Message.new
  end

  def create
    # binding.pry
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      # binding.pry
    end
    # binding.pry
  end

  private

  def message_params
    params.require(:message).permit(
      :text
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
