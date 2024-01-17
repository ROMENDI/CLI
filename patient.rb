class Patient
  attr_accessor :name, :appointments

  def initialize(name)
    @name = name
    @appointments = []
  end

  def schedule_appointment(date, procedure)
    @appointments << { date: date, procedure: procedure }
    puts "Appointment scheduled on #{date} for a #{procedure}."
  end

  def delete_appointment(date)
    @appointments.delete_if { |appointment| appointment[:date] == date }
    puts "Appointment on #{date} has been deleted."
  end

  def view_appointments
    @appointments.each do |appointment|
      puts "Date: #{appointment[:date]}, Procedure: #{appointment[:procedure]}"
    end
  end
end
