require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/spellchecker"

class SpellcheckerTest < Test::Unit::TestCase
  
  def test_incorrect_spelling_results
    test_string = 'sentance'
    result = Spellchecker.check(test_string)
    
    assert_equal false, result.first[:correct]
    assert_equal 'sentance', result.first[:original]
    assert_equal Array, result.first[:suggestions].class
  end
  
  def test_correct_spelling_results
    test_string = 'sentence'
    result = Spellchecker.check(test_string)
    
    assert_equal true, result.first[:correct]
    assert_equal 'sentence', result.first[:original]
  end
  
end