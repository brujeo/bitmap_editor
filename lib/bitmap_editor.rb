require_relative 'bitmap.rb'
require_relative 'command.rb'
require_relative 'command_executor.rb'

# Interactive Bitmap Editor
#
# Author::    Leonid Brujev  (mailto:brujev@gmail.com)
# License::   Distributes under the same terms as Ruby

# This class represents a bitmap editor object that has a main goal
# to parse input file and pass commands to executor object

class BitmapEditor

    # Runs a command file
    #
    # @param file [String] the command file path
    def run(file)
        return puts "please provide correct file" if file.nil? || !File.exists?(file)

        bitmap = Bitmap.new
        executor = CommandExecutor.new

        File.open(file).each do |line|
            line = line.chomp
            command = Command.new line
            if command
                executor.execute(bitmap, command)
            end
        end
    end
end
