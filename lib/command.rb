# Interactive Bitmap Editor
#
# Author::    Leonid Brujev  (mailto:brujev@gmail.com)
# License::   Distributes under the same terms as Ruby

# This class represents a command object that keeps
# an command action and attributes. It has methods to parse
# command passed as a string and to validate it

class Command

    @action = ""
    @attributes = []

    # Initialisation
    #
    # @param cmd [String] the string command
    def initialize(cmd = nil)
        parse(cmd)  if cmd != nil
    end

    # Checks if command action and attributes are valid.
    #
    # @param action [Symbol] the command action
    # @param attributes [Array] the list of command attributes
    # @return [Bool]
    def is_valid(action, attributes)
        rules = {
            'I' => [/^[1-9]{1,3}$/, /^[1-9]{1,3}$/],
            'L' => [/^[1-9]{1,3}$/, /^[1-9]{1,3}$/, /^[A-Z]{1}$/],
            'V' => [/^[1-9]{1,3}$/, /^[1-9]{1,3}$/, /^[1-9]{1,3}$/, /^[A-Z]{1}$/],
            'H' => [/^[1-9]{1,3}$/, /^[1-9]{1,3}$/, /^[1-9]{1,3}$/, /^[A-Z]{1}$/],
            'S' => [],
            'C' => [],
        }

        # check if command is supported
        if !rules.key?(action)
            return false
        end

        # check if number of attributes is valid
        if rules[action].count != attributes.count
            return false
        end

        # loop through attributes and validate each one
        i = 0
        while i < attributes.count do
            if !attributes[i].match(rules[action][i])
                return false
            end
            i += 1
        end

        return true
    end

    # Parses a string command and sets Command object action and attributes.
    #
    # @param cmd [String] the string command
    def parse(cmd)
        str = cmd.split(" ")
        action = str.shift

        if is_valid(action, str)
            @action = action
            @attributes = str
        else
            raise 'Command cannot be parsed.'
        end
    end

    attr_reader :action, :attributes

end