class Spellchecker
  require 'net/https'
  require 'uri'
  require 'rexml/document'
  
  ASPELL_WORD_DATA_REGEX = Regexp.new(/\&\s\w+\s\d+\s\d+(.*)$/)
  ASPELL_PATH = "aspell"
  
  def self.check(text, lang='en')
    spell_check_response = `echo "#{text}" | #{ASPELL_PATH} -a -l #{lang}`
    unless spell_check_response == ''
      response = text.split(' ').collect { |original| {:original => original} }
      spell_check_response.split("\n").slice(1..-1).each_with_index do |error, index|
        if match_data = error.match(ASPELL_WORD_DATA_REGEX)
          response[index].merge!(:correct => false, :suggestions => error.split(',')[1..-1].collect(&:strip!))
        else
          response[index].merge!(:correct => true)
        end
      end
      return response
    else
      raise 'Aspell command not found'
    end
  end
end