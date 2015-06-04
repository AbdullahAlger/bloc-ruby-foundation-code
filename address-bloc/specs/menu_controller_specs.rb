RSpec.describe MenuController do
  context ".view_entry_number" do

    it "should respond to a number for the entry" do
      menu = MenuController.new

      expect(menu.view_all_entries).to be_a(Array)
    end

  end
end
