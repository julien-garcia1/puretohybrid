module ApplicationHelper
  def current_class?(root_path)
    if request.path == root_path
      return 'active'
    elsif request.path == barcode_path
      return 'active'
    elsif request.path == products_path
      return 'active'
    else
      return 'active'
    end
  end
end
