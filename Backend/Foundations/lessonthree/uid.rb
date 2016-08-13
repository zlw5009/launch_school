ALPHANUMERIC_CHARS = (0..9).to_a.concat(('a'..'f').to_a)

def rand_chrs(count)
  ALPHANUMERIC_CHARS.sample(count).join
end

def uuid
  [8, 4, 4, 4, 12].map { |n| rand_chrs(n) }.join('-')
end

puts uuid