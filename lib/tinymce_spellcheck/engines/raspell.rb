require 'raspell'

module TinymceSpellcheck
  module Engines
    class Raspell
      def initialize(options = {})
      end

      def check_words(lang, words)
        @speller = Aspell.new(lang)
        @speller.suggestion_mode = Aspell::NORMAL

        misspelled = []
        words.each do |word|
          misspelled << word unless @speller.check(word)
        end
        misspelled
      end

      def get_suggestions(lang, word)
        @speller = Aspell.new(lang)
        @speller.suggestion_mode = Aspell::NORMAL
        @speller.suggest(word)
      end
    end
  end
end
