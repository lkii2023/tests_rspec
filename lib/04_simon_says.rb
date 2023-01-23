def echo(string)
    return string
  end
  
  def shout(string)
    return string.upcase
  end
  
  def repeat(string, n=2)
    return string * n
  end
  
  def start_of_word(string, n=1)
    return string[0, n]
  end
  
  def first_word(string)
    return string.split[0]
  end
  
  def titleize(string)
    little_words = ["and", "the", "over"]
    words = string.split
    words.each do |word|
      if !little_words.include?(word) || words.index(word) == 0
        word.capitalize!
      end
    end
    return words.join(" ")
  end
  