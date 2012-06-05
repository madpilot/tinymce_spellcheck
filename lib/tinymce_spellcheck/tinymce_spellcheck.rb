module TinymceSpellcheck
  class TinymceSpellcheck
    def initialize(options = {}, engine = nil)
      @@engines = [ :raspell ]
      unless engine
        engine = :raspell
      end

      raise Exception, "Unsupported engine" unless (engine && @@engines.include?(engine))
      
      @engine = Engines.const_get(engine.to_s.classify).new(options)
    end

    def check_words(lang, words)
      @engine.check_words(lang, words)
    end

    def get_suggestions(lang, word)
      @engine.get_suggestions(lang, word)
    end
  end
end
