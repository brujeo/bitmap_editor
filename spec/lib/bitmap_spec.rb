require 'bitmap'

RSpec.describe Bitmap, :type => :model do

    before(:each) do
        @bitmap = Bitmap.new
    end

    describe "#create" do
        it "creates a bitmap image of specified size and color on request" do
            @bitmap.create(5, 10, 'Z')
            image = @bitmap.instance_variable_get(:@image)
            expect(image[1].count).to eq 5  # x-scale
            expect(image.count).to eq 10    # y-scale
            expect(image[1][1]).to eq 'Z'   # colour
        end
    end

    describe "#change_colour" do
        it "changes colour for the specified part of the image" do
            @bitmap.create(5, 10, 'Z')
            image = @bitmap.instance_variable_get(:@image)
            expect(image[1][1]).to eq 'Z'   # check that colour is as expected
            expect(image[2][2]).to eq 'Z'   # check that colour is as expected

            @bitmap.change_colour(2, 2, 3, 3, 'D')
            image = @bitmap.instance_variable_get(:@image)
            expect(image[1][1]).to eq 'Z'   # check that colour has not been changed
            expect(image[2][2]).to eq 'D'   # check that colour has been changed
        end
    end

    describe "#reset_colour" do
        it "resets a colour of the entire image to a specified one" do
            @bitmap.create(5, 10, 'Z')
            image = @bitmap.instance_variable_get(:@image)
            expect(image[1][1]).to eq 'Z'   # check that colour is as expected

            @bitmap.reset_colour('D')
            image = @bitmap.instance_variable_get(:@image)
            expect(image[1][1]).to eq 'D'   # check that colour has been changed
        end
    end

end