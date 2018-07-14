# frozen_string_literal: true

# A Hook to check if any banned_words are found then fail.
module Overcommit::Hook::PreCommit
  class GrepChecks < Base
    def run
      error_lines = []
      warning_lines = []
      # The `config` attribute is a hash of
      # your settings based on your `.overcommit.yml` file.
      banned_words = config['banned_words']
      pattern = Regexp.new(banned_words.join("|"))
      applicable_files.each do |file|
        next unless File.extname(file) == '.rb'
        modified_lines_num = modified_lines_in_file(file)
        File.open(file, 'r').each_with_index do |line, index|
          match = pattern.match(line)
          if match
            message = format("#{file}:#{index + 1}: contains offending "\
                             "pattern: #{match.to_s}.")
            if modified_lines_num.include?(index + 1)
              error_lines << message
            else
              warning_lines << message
            end
          end
        end
      end

      return :fail, error_lines.join("\n") if error_lines.any?
      if warning_lines.any?
        return :warn, "Modified files fail word check (on lines you didn't "\
                      "modify)\n" << warning_lines.join("\n")
      end

      :pass
    end
  end
end
