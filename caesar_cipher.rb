ALPHABETS = 26

def caesar_cipher(input, shift)
  return input if input.empty? ||
                  shift.zero? ||
                  (shift % ALPHABETS).zero?

  input.chars.map { |char| shift_char(char, shift) }.join
end

def shift_char(char, shift)
  if char.match(/[a-zA-Z]/)
    base = (char >= 'a' ? 'a' : 'A').ord
    old_index = char.ord - base
    new_index = (old_index + shift) % ALPHABETS

    (new_index + base).chr
  else
    char
  end
end
