require_relative 'patient'
require_relative 'dentist_office'

class App
  def self.run
    office = DentistOffice.new
    office.run
  end
end

App.run
