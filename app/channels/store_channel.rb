class StoreChannel < ApplicationCable::Channel
  def subscribed
    @store = Store.find(params[:id])
    # @store = Store.find(params[:store_id])
    stream_for store
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
