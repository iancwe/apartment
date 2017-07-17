class RescueElevator < ::Apartment::Elevators::Subdomain

  def call(env)
    super
  rescue ::Apartment::TenantNotFound => e
    # Rollbar.error(e, "ERROR: Apartment Tenant not found: #{Apartment::Tenant.current.inspect}")
    static_404_page = File.read(Rails.root.to_s + '/public/404.html')
    return [ 404,  {'Content-Type' => 'text/html' }, [static_404_page] ]
  end

end
