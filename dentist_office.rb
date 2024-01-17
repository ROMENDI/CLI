require_relative "patient" 

class DentistOffice
  def initialize
    @patients = {}
  end

  def add_patient(name)
    @patients[name] = Patient.new(name) unless @patients.key?(name)
  end

  def find_patient(name)
    @patients[name]
  end

  def run
    loop do
      puts "Welcome to the Dentist Office Scheduler!"
      puts "1. Schedule an Appointment"
      puts "2. Delete an Appointment"
      puts "3. View Appointments"
      puts "4. Exit"
      choice = gets.chomp.to_i
    
      case choice
      when 1
        print "Enter your name: "
        name = gets.chomp
        print "Enter appointment date (e.g., 2024-01-30): "
        date = gets.chomp
        print "Enter procedure type: "
        procedure = gets.chomp
        office.add_patient(name)
        patient = office.find_patient(name)
        patient.schedule_appointment(date, procedure)
      when 2
        print "Enter your name: "
        name = gets.chomp
        print "Enter appointment date to delete: "
        date = gets.chomp
        patient = office.find_patient(name)
        patient.delete_appointment(date) if patient
      when 3
        print "Enter your name: "
        name = gets.chomp
        patient = office.find_patient(name)
        patient.view_appointments if patient
      when 4
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end 
  
end
