class LocationForm < BaseForm
  with_options default: nil do
    integer :id
    record  :location_type
    string  :street_address
    string  :neighborhood
    string  :city
    string  :state
    string  :zip
    string  :county
    string  :region
  end

  def execute
    return nil if inputs.values.all?(&:blank?)

    (id? ? Location.find(id) : Location.new).tap do |location|
      location.attributes = given_inputs
    end
  end
end
