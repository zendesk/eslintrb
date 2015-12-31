module Eslintrb
  module Reporter
    class Default

      def format(errors, file = nil)
        result = ''
        indent = ''
        if file then
          indent = '  '
        end

        errors.each do |error|
          if error.nil? then
            result += indent + 'fatal error'
          else
            result += indent + 'line ' + error["line"].to_s + ', col ' +
              error["column"].to_s + ', ' + error["message"].to_s + "\n"
          end
        end

        if file && result.size > 0 then
          result = 'file: ' + file + "\n" + result
        end

        result
      end

    end
  end
end
