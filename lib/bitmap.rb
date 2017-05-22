# Interactive Bitmap Editor
#
# Author::    Leonid Brujev  (mailto:brujev@gmail.com)
# License::   Distributes under the same terms as Ruby

# This class represents a bitmap object that keeps
# an image as it's variable. It has methods to create
# and that image

class Bitmap

    @image = {}

    # Creates an image of X*Y size and specified colour
    #
    # @param x [Integer] the size of X axis
    # @param y [Integer] the size of Y axis
    # @param colour [Symbol] the colour
    def create(x, y, colour)
        @image = {}
        i = 1
        while i <= y  do
            @image[i] = {}
            j = 1
            while j <= x  do
                @image[i][j] = colour
                j += 1
            end
            i += 1
        end
    end

    # Changes entire image colour to a specified one
    #
    # @param colour [Symbol] the colour
    def reset_colour(colour)
        change_colour(1, 1, @image[1].count, @image.count, colour)
    end

    # Changes  image portion colour to a specified one
    #
    # @param from_x [Integer] X axis starting point
    # @param from_y [Integer] Y axis starting point
    # @param to_x [Integer] X axis end point
    # @param to_y [Integer] Y axis starting point
    # @param colour [Symbol] the colour
    def change_colour(from_x, from_y, to_x, to_y, colour)
        i = from_y.to_i
        while i <= to_y.to_i  do
            j = from_x.to_i
            while j <= to_x.to_i  do
                @image[i][j] = colour
                j += 1
            end
            i += 1
        end
    end

    # Shows image.
    def show
        if @image.count > 0
            @image.each do |k1, v|
                v.each do |k2, v2|
                    print @image[k1][k2]
                end
                puts ""
            end
        else
            puts "There is no image"
        end
    end

end