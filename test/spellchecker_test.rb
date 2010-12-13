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
  
  def test_proper_handling_of_numbers
    test_string = 'sentance 2457563'
    result = Spellchecker.check(test_string)
    
    assert_equal 2, result.length
    assert_equal 'sentance', result.first[:original]
    assert_equal '2457563', result[1][:original]
    assert_equal true, result[1][:correct]
  end
  
  def test_blank_text_handling
    test_string = ''
    result = Spellchecker.check(test_string)
    
    assert_equal 0, result.length
  end
  
  def test_setting_of_aspell_path
    assert_equal 'aspell', Spellchecker.aspell_path
    
    path = '/usr/local/aspell'
    Spellchecker.aspell_path = path
    assert_equal path, Spellchecker.aspell_path
  end
  
  def test_correct_spelling_results
    test_string = 'sentence'
    result = Spellchecker.check(test_string)
    
    assert_equal true, result.first[:correct]
    assert_equal 'sentence', result.first[:original]
  end
  
end