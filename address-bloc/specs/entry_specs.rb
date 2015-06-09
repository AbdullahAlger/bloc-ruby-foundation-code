require_relative "../models/entry"

RSpec.describe Entry do
  context "attributes" do

    it "should respond to name" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:name)
    end

    it "should respond to phone number" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:email)
    end
  end

  context "#to_s" do

    it "should print an entry as a string" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"

      expect(entry.to_s).to eq(expected_string)
    end
  end

  context "#==(other)" do

    it "should check the equality of two objects" do
      entry_one = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      entry_two = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry_one).to eq(entry_two)
      expect(entry_one == entry_two).to eq(true)
      expect(entry_two == entry_one).to eq(true)
    end

    it "should return false for two different objects" do
      entry_one = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      entry_two = Entry.new('Ed Lovelace', '020.012.1815', 'ed.king@lovelace.com')
      expect(entry_one).not_to eq(entry_two)
      expect(entry_one == entry_two).to eq(false)
      expect(entry_two == entry_one).to eq(false)
    end

  end

end
