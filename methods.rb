def roman_to_arabic(roman)
  roman_numerals = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  arabic = 0
  prev_value = 0

  roman.reverse.each_char do |char|
    value = roman_numerals[char]

    if value < prev_value
      arabic -= value
    else
      arabic += value
    end

    prev_value = value
  end

  arabic
end

def arabic_to_roman(arabic)
  roman_numerals = {
    1000 => 'M',
    900  => 'CM',
    500  => 'D',
    400  => 'CD',
    100  => 'C',
    90   => 'XC',
    50   => 'L',
    40   => 'XL',
    10   => 'X',
    9    => 'IX',
    5    => 'V',
    4    => 'IV',
    1    => 'I'
  }

  roman = ''

  roman_numerals.each do |value, numeral|
    while arabic >= value
      roman += numeral
      arabic -= value
    end
  end

  roman
end

def valid_roman_numeral?(roman)
  valid_chars = 'IVXLCDM'
  prev_char = nil
  prev_count = 0
  max_repeats = 3

  roman.chars.each_with_index do |char, index|
    unless valid_chars.include?(char)
      return false
    end

    case char
    when 'I', 'X', 'C', 'M'
      # проти записів типу "XIM", "XD"
      if (roman[index + 1] != nil && valid_chars.include?(roman[index + 1])) &&
        (valid_chars.index(roman[index + 1]) >= valid_chars.index(char) + 3)
        return false
      end
      if prev_char == char
        prev_count += 1
        # проти записів типу: "XXXXI", "XXXXXI" та(або) записів типу "IIX", "IIIX"
        if (prev_count > max_repeats) || (roman[index + 1] != nil && roman[index + 1] >= valid_chars[valid_chars.index(char) + 1])
          return false
        end
      else
        prev_char = char
        prev_count = 1
      end
    when 'V', 'L', 'D'
      if prev_char == char
        return false
      # Проти записів типу "VX", "LC", "DM", "VM" і т. д.
      elsif roman[index + 1] != nil && valid_chars.include?(roman[index + 1]) &&
        valid_chars.index(roman[index + 1]) >= valid_chars.index(char) + 1
        return false
      else
      prev_char = char
      prev_count = 1
      end
    else
      return false
    end
  end

  true
end