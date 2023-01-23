class PigLatin
    def translate(phrase)
      vowels = %w(a e i o u)
      words = phrase.split(" ")
      result = []
      words.each do |word|
        if vowels.include?(word[0].downcase)
          result << word + "ay"
        else
          first_vowel_index = 0
          word.chars.each_with_index do |char, index|
            if vowels.include?(char.downcase)
              first_vowel_index = index
              break
            end
            if (char.downcase == 'q' && word[index + 1] && word[index + 1].downcase == 'u')
              first_vowel_index = index + 1
              break
            end
          end
          result << word[first_vowel_index..-1] + word[0...first_vowel_index] + "ay"
        end
      end
      result.join(" ")
    end
  end
  

  # pig_latin_spec.rb
require_relative './lib/06_pig_latin'

describe PigLatin do
  describe "#translate" do
    it "translates a word beginning with a vowel" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("apple")
      expect(s).to eq("appleay")
    end

    it "translates a word beginning with a consonant" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("banana")
      expect(s).to eq("ananabay")
    end

    it "translates a word beginning with two consonants" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("cherry")
      expect(s).to eq("errychay")
    end

    it "translates two words" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("eat pie")
      expect(s).to eq("eatay iepay")
    end

    it "translates a word beginning with three consonants" do
      pig_latin = PigLatin.new
      expect(pig_latin.translate("three")).to eq("eethray")
    end

    it "counts 'sch' as a single phoneme" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("school")
      expect(s).to eq("oolschay")
    end

    it "counts 'qu' as a single phoneme" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("quiet")
      expect(s).to eq("ietquay")
    end


    it "counts 'qu' as a consonant even when it's preceded by a consonant" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("square")
      expect(s).to eq("aresquay")
    end

    it "translates many words" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("the quick brown fox")
      expect(s).to eq("ethay ickquay ownbray oxfay")
    end

    it "retains the capitalization of the original word" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("The Quick Brown Fox")
      expect(s).to eq("Ethay Ickquay Ownbray Oxfay")
    end

    it "retains the punctuation from the original phrase" do
      pig_latin = PigLatin.new
      s = pig_latin.translate("Eat pie, now!")
      expect(s).to eq("Eatay iepay, owaynay!")
    end
  end
end
