class StoreChannel < ApplicationCable::Channel
  def subscribed
    store = Store.find(params[:id])
    ap "je suis dans #{__method__}"
    ap store
    stream_for store
  end
end
