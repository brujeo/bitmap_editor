require 'bitmap_editor'

RSpec.describe BitmapEditor, :type => :model do

    before(:each) do
        @editor = BitmapEditor.new
    end

    describe "#run" do
        it "shows an error message when file path is invalid" do
            expect(STDOUT).to receive(:puts).with("please provide correct file")
            res = @editor.run("test")
        end
    end

end