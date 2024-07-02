class PartiesController < ApplicationController

  def new
    @score = params[:score]
    letter
  end

  def letter
    vowel = ["A", "E", "I", "O", "U", "Y"]
    @alphabet = ("A".."Z").to_a
    @letters = []
    5.times do
      @letters << vowel.sample
    end
    words = @alphabet - vowel
    5.times do
      @letters << words.sample
    end
    @letters.shuffle!
  end

  def score
    @score = 0
    @input_word = params[:party][:word].downcase
    @letters = params[:party][:ten_letters_list].downcase.chars
    @verif = include?(@input_word, @letters)

    #calcule marche pas 
    if @verif
      @score += @input_word.length
    else
      @score += 0
    end
    redirect_to new_party_path(score: @score)
  end

  def include?(input_word, letters)
    file_path = Rails.root.join('public', 'words.txt')
    file = File.read(file_path)
    word_in_file = file.include?(input_word)
    chars_match = input_word.chars.all? { |char| letters.include?(char) }
    puts "lettre: #{letters}" #ok
    puts "Mot soumis: #{input_word}"#OK
    puts "Mot trouvé dans le fichier: #{word_in_file}"#OK
    puts "Tous les caractères correspondent: #{chars_match}"
  end
end
