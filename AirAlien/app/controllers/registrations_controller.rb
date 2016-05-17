class RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params) #make update without using password
    resource.update_without_password(params)
  end  
end