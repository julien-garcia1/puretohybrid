class StoreChannel < ApplicationCable::Channel
  def subscribed
    store = Store.find(params[:id])
    stream_for store
  end
end
