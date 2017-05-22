require 'command'

RSpec.describe Command, :type => :model do

    before(:each) do
        @command = Command.new
    end

    describe "#parse" do
        context "valid arguments" do
            it "parses a command and axtracts command action and attributes" do
                @command.parse('I 5 6')
                expect(@command.instance_variable_get(:@action)).to eq 'I'  # command action
                attributes = @command.instance_variable_get(:@attributes)   # command attributes
                expect(attributes[0].to_i).to eq 5  # size X
                expect(attributes[1].to_i).to eq 6  # size Y
            end
        end
        context "invalid arguments" do
            it "shows an error when command action is invalid" do
                expect { @command.parse('Z') }.to raise_error('Command cannot be parsed.')
            end
            it "shows an error when number of command attributes is not as expected" do
                expect { @command.parse('I 1') }.to raise_error('Command cannot be parsed.')
            end
            it "shows an error when command argument exceeds limit size" do
                expect { @command.parse('I 10000 5') }.to raise_error('Command cannot be parsed.')
            end
            it "shows an error when command argument is not of expected type" do
                expect { @command.parse('I 5 D') }.to raise_error('Command cannot be parsed.')
            end
        end
    end

end