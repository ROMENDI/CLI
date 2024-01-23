require 'minitest/autorun'
require_relative '../patient'

class PatientTest < Minitest::Test

  def setup
    @patient = Patient.new("Bill")
  end

  def test_schedule_appointment
    @patient.schedule_appointment("2024-01-30", "Checkup")
    assert_equal 1, @patient.appointments.length
    assert_equal "2024-01-30", @patient.appointments.first[:date]
    assert_equal "Checkup", @patient.appointments.first[:procedure]
  end
  
  def test_delete_appointment
    @patient.schedule_appointment("2024-01-30", "Checkup")
    @patient.delete_appointment("2024-01-30")
    assert_empty @patient.appointments
  end
end
