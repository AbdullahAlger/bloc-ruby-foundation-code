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

  def binary_search(name)
    lower = 0 # begin at the first part of the array
    upper = entries.length - 1 # get the farthest end of the array (-1 because array length is 0...n)

    while lower <= upper # loop until the lower part is less than or equal to the upper
      mid = (lower + upper) / 2 # middle of the array
      mid_name = entries[mid].name # the middle index of name
      if name == mid_name # if name is in the middle
        return entries[mid] # return the entry
      elsif name < mid_name # if the name is before the middle (lower)
        upper = mid - 1 # subtract the upper portion since it's in the lower part
      elsif name > mid_name # if the name is after the middle (upper)
        lower = mid + 1 # add the lower portion since it's in the upper part
      end
    end
    return nil # no match found send nil
  end

  def iterative_search(name)
    index = 0
    while index < entries.length
      if name == entries[index].name
        return entries[index]
      end
      index += 1
    end
    return nil
  end


  def import_from_csv(file_name) # imports the file
    csv_text = File.read(file_name) # reads the CSV file
    csv = CSV.parse(csv_text, headers: true) # parse the file > object
    csv.each do |row| #iterate over CSV object's rows
      row_hash = row.to_hash # create a hash for each row
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"]) # convert row hash to entry using method
      # add_entry(row["name"], row["phone_number"], row["email"])
    end
    return csv.count # gets the number of items parsed from the CSV
  end
end

