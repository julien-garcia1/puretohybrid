module ApplicationHelper
  def current_class?(root_path)
    return 'active' if request.path == root_path
    ''
  end
end
