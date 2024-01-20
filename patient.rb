class Patient
  attr_accessor :name, :appointments

  def initialize(name)
    @name = name
    @appointments = []
  end

  def schedule_appointment(date, procedure)
    if @appointments.any? { |appointment| appointment[:date] == date }
      puts "An appointment is already scheduled on #{date}."
    else
      @appointments << { date: date, procedure: procedure }
      puts "Appointment scheduled on #{date} for a #{procedure}."
    end
  end

  def delete_appointment(date)
    if @appointments.any? { |appointment| appointment[:date] == date }
    @appointments.delete_if { |appointment| appointment[:date] == date }
    puts "Appointment on #{date} has been deleted."
    else
      puts "No appointment found on #{date}."
    end
  end

  def view_appointments
    if @appointments.empty?
      puts "No appointments scheduled."
    else
      @appointments.each do |appointment|
        puts "Date: #{appointment[:date]}, Procedure: #{appointment[:procedure]}"
      end
    end
  end
  
end
