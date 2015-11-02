KEYBOARD = {
  2 => 'abc2',
  3 => 'def3',
  4 => 'ghi4',
  5 => 'jkl5',
  6 => 'mno6',
  7 => 'pqrs7',
  8 => 'tuv8',
  9 => 'wxyz9',
  0 => ' 0',
}

def button_presses(str)
  str = str.downcase
  presses = 0
  str.split("").each do |i|
    presses += get_symbol_presses(i)
  end
  presses
end

def get_symbol_presses(symbol)
  presses = 0
  if symbol == '1' or symbol == '*' or symbol == '#' then presses += 1 end
  KEYBOARD.keys.each do |key|
    if KEYBOARD[key].include?(symbol)
      presses += (KEYBOARD[key].index(symbol) + 1)
    end
  end
  presses
end
