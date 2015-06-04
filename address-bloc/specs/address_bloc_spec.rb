RSpec.describe AddressBook do

  let(:book) {AddressBook.new}

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries2.csv")
      book_size = book.entries.size

      expect(book_size).to eql 3
    end

    it "checks the details of the first entry" do
      book.import_from_csv("entries2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Beowulf", "I'm a Geat and don't have a phone!", "What's email?")
    end

    it "checks the details of the second entry" do
      book.import_from_csv("entries2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Chicken", "Bakah I don't have hands!", "Same as the first")
    end

    it "checks the details of the third entry" do
      book.import_from_csv("entries2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Henry", "222-222-2222", "thedog@henry.com")
    end

    it "checks if Beowulf is in the entries" do
      book.import_from_csv("entries2.csv")
      book.entries.find do |entry|
        expect(entry.name).to be == "Beowulf"
      end
    end

  end
end