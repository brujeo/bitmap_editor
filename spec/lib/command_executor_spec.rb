require 'command_executor'

RSpec.describe CommandExecutor, :type => :model do

    before(:each) do
        @executor = CommandExecutor.new
    end

    describe "#execute" do
        it "trigggers bitmap image create method when 'I' command is passed" do
            bitmap = Bitmap.new
            command = Command.new "I 5 6"
            allow(Bitmap).to receive_message_chain(:create)
            expect(bitmap).to receive(:create).with(5, 6, "O")
            @executor.execute(bitmap, command)
        end
        it "trigggers bitmap image reset colour method when 'C' command is passed" do
            bitmap = Bitmap.new
            command = Command.new "C"
            allow(Bitmap).to receive_message_chain(:reset_colour)
            expect(bitmap).to receive(:reset_colour).with("O")
            @executor.execute(bitmap, command)
        end
        it "trigggers bitmap image change colour method when 'L' command is passed" do
            bitmap = Bitmap.new
            command = Command.new "L 2 3 A"
            allow(Bitmap).to receive_message_chain(:change_colour)
            expect(bitmap).to receive(:change_colour).with(2, 3, 2, 3, "A")
            @executor.execute(bitmap, command)
        end
        it "trigggers bitmap image change colour method when 'V' command is passed" do
            bitmap = Bitmap.new
            command = Command.new "V 2 3 6 W"
            allow(Bitmap).to receive_message_chain(:change_colour)
            expect(bitmap).to receive(:change_colour).with(2, 3, 2, 6, "W")
            @executor.execute(bitmap, command)
        end
        it "trigggers bitmap image change colour method when 'H' command is passed" do
            bitmap = Bitmap.new
            command = Command.new "H 3 5 2 Z"
            allow(Bitmap).to receive_message_chain(:change_colour)
            expect(bitmap).to receive(:change_colour).with(3, 2, 5, 2, "Z")
            @executor.execute(bitmap, command)
        end
        it "trigggers bitmap image show method when 'S' command is passed" do
            bitmap = Bitmap.new
            command = Command.new "S"
            allow(Bitmap).to receive_message_chain(:show)
            expect(bitmap).to receive(:show)
            @executor.execute(bitmap, command)
        end
    end

end