require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - View Entry Number n"
    puts "5 - Import entries from a CSV"
    puts "6 - Delete all entries"
    puts "7 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        view_entry_number
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        system "clear"
        kill_dave
        main_menu
      when 7
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries
    print "Search by name: " # get the name the user wants to search for
    name = gets.chomp
    match = @address_book.binary_search(name) # search for the name in the address_book
    system "clear"

    if match.to_s # check if search returned a match
      search_submenu(match) # displays a list of operations can be found on an Entry
    else
      puts "No match found for #{name}"
    end
  end

  def search_submenu(entry) # print out the submenu for an entry
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp # save the user input to selection

    case selection # takes an action based on user input
      when "d" # delete entry
        system "clear"
        delete_entry(entry)
        main_menu
      when "e" # edit entry
        edit_entry(entry)
        system "clear"
        main_menu
      when "m" # return to the main menu
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end

  def view_entry_number
    system "clear"
    print "Which entry would you like Dave? "
    entry = @address_book.entries
    selection = gets.to_i
    if selection > 0 && selection <= entry.length
      puts entry[selection - 1].to_s
    elsif selection == 0
      puts "Dave, I can't search for something that doesn't exist."
    else
      puts "Dave, I don't have that many entries. Please try again"
    end
  end

  def read_csv
    print "Enter CSV file to import: " # prompt user for a CSV file
    file_name = gets.chomp # get the files from STDIN and chomp file to delete newlines

    if file_name.empty? # check to see if the file is empty
      system "clear"
      puts "No CSV file read"
      main_menu # return to the main menu if it is
    end

    begin # protects the program and keeps it from crashing if exception is raised (a warning)
      entry_count = @address_book.import_from_csv(file_name) # import the file to address_book
      system "clear" # clear the screen
      puts "#{entry_count} new entries added from #{file_name}" # print the number of entries that were read from the file
    rescue # program is rescued when an exception is raised
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv # calling import_from_csv again
    end
  end

  def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def kill_dave
    system "clear"
    entries = @address_book.entries
    if @address_book.entries.length > 0
      print "Are you sure you want to terminate your entries Dave? (y/n) "
      response = gets.chomp
      system "clear"
      if response == "Y" || response == "y"
        while entries.length > 0
          entries.each do |entry|
            delete_entry(entry)
          end
        end
      else
        puts "Bye Dave"
        main_menu
      end
    else
      main_menu
    end
  end

  def edit_entry(entry)
    # series of print statements followed by gets.chomp
    # each gets.chomp gathers user information and assigns it to the variables
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp

    # using attribute.empty? to set attributes only if it was read from user input
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"

    # print out entry with the updated attributes
    puts "Updated entry:"
    puts entry
  end

  def entry_submenu(entry)
    puts "\nn - next entry"
    puts "d - delete entry"
    puts "e - edit entry"
    puts "m - return to main menu"

    selection = $stdin.gets.chomp

    case selection
      when "n"
      when "d"
        # control will return the view_all_entries and the next entry will be displayed
        delete_entry(entry)
      when "e"
        edit_entry(entry)
        entry_submenu(entry)
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
end

