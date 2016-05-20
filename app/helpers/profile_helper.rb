module ProfileHelper

def resource_name
    :member
  end
 
  def resource
    @resource ||= Member.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
