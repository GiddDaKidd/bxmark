class RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) && resource.can_publish?
        publisher_url
      else
        super
      end
end
