def echo(string)
    return string
  end

  def shout(string)
    return string.upcase
  end

  def repeat(string, n=2)
    return ([string] * n).join(" ")
  end

  def start_of_word(string, n=1)
    return string[0, n]
  end

  def first_word(string)
    return string.split[0]
  end

  def titleize(text)
    stop_words = %w{a an and the or for of nor}
    return text.split.each_with_index.map{|word, index| stop_words.include?(word) && index > 0 ? word : word.capitalize }.join(" ")
  end

  