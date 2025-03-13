ALPHABETS = 26

def caesar_cipher(str, right_shift)
  return str if str.empty? ||
                right_shift.zero? ||
                (right_shift % ALPHABETS).zero?

  str.chars.map do |character|
    if character.match(/[a-zA-Z]/)
      base = (character >= 'a' ? 'a' : 'A').ord
      old_index = character.ord - base
      new_index = (old_index + right_shift) % ALPHABETS

      (new_index + base).chr
    else
      character
    end
  end.join
end
