require 'minitest/autorun'
require_relative '../dentist_office'
require_relative '../patient'

class DentistOfficeTest < Minitest::Test
  
  def setup
    @office = DentistOffice.new
  end

  def test_add_patient
    @office.add_patient("Bob")
    assert_includes @office.instance_variable_get(:@patients), "Bob"
  end

  def test_appointment_exists
    @office.add_patient("Charlie")
    patient = @office.find_patient("Charlie")
    patient.schedule_appointment("2024-01-31", "Cleaning")
    assert @office.appointment_exists?("2024-01-31")
  end
end
