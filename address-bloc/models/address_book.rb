require_relative "entry.rb"
require "csv"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone, email))
  end

  def remove_entry(person)
    @entries.each do |entry|
      if entry.name == person
        @entries.delete(entry)
      end
    end
  end

  def import_from_csv(file_name) # imports the file
    csv_text = File.read(file_name) # reads the CSV file
    csv = CSV.parse(csv_text, headers: true) # parse the file > object

    csv.each do |row| #iterate over CSV object's rows
      #row_hash = row.to_hash # create a hash for each row
      #add_entry(row_hash["name"], row_hash["phone_number"], row_hash("email")) # convert row hash to entry using method
      add_entry(row["name"], row["phone_number"], row["email"])
    end
    return csv.count # gets the number of items parsed from the CSV
  end
end

