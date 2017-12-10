class RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(user)
    stored_location_for(user) ||
      if resource.is_a?(user) && resource.can_publish?
        publisher_url
      else
        super
      end
