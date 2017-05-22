# Interactive Bitmap Editor
#
# Author::    Leonid Brujev  (mailto:brujev@gmail.com)
# License::   Distributes under the same terms as Ruby

# This class represents a command executor object that has a main goal to execute
# correct bitmap image method based on command passed

class CommandExecutor

    # Executes a method on bitmap object based on command object passed.
    #
    # @param bitmap [Bitmap]
    # @param command [command]
    def execute(bitmap, command)
        a = command.attributes
        case command.action
        when "I"
            bitmap.create(a[0].to_i, a[1].to_i, "O")
        when "C"
            bitmap.reset_colour("O")
        when "L"
            bitmap.change_colour(a[0].to_i, a[1].to_i, a[0].to_i, a[1].to_i, a[2])
        when "V"
            bitmap.change_colour(a[0].to_i, a[1].to_i, a[0].to_i, a[2].to_i, a[3])
        when "H"
            bitmap.change_colour(a[0].to_i, a[2].to_i, a[1].to_i, a[2].to_i, a[3])
        when "S"
            bitmap.show
        else
            puts 'unrecognised command :('
        end
    end

end