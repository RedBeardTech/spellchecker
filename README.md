# Spellchecker

A simple gem which wraps the Aspell command line utility to provide spell checking in ruby.

## Features

  * Supports all dictionaries supported by [Aspell](ftp://ftp.gnu.org/gnu/aspell/dict/0index.html). Defaults to English.
  * Provides suggested spellings for misspelled words.

## Usage

Spellchecker only has one method:

    Spellchecker.check(text, dictionary='en')

The `check` method returns an array of hashes representing the words passed in with the initial string. Here's an example:

    text_to_check = 'Theis sentence has many speling mistackes'
    
    results = Spellchecker.check(text_to_check)
    
    results[0] => { :original => 'Theis', :correct => false, :suggestions => ["The-is", "Theirs", "This"] }
    results[1] => { :original => 'sentence', :correct => true }

## Note on Patches/Pull Requests
 
  * Fork the project.
  * Make your feature addition or bug fix.
  * Commit.
  * Add tests if applicable. That way we won't break anything.
  * Send me a pull request.
  
## Copyright

Copyright (c) 2010 RedBeard Tech. See LICENSE for details.