require_relative "methods.rb"

puts "=== Меню ==="
while true
  puts "1. Приклад 1"
  puts "2. Приклад 2"
  puts "3. Приклад 3"
  puts "4. Свій приклад(Арабські -> Римські)"
  puts "5. Свій приклад(Римські -> Арабські)"
  puts "6. Вихід"
  choice = gets.to_i
  case choice
  when 1
    puts "MDCLXVI арабськими цифрами:"
    puts roman_to_arabic("MDCLXVI")
    puts "2008 римськими цифрами:"
    puts arabic_to_roman(2008)
  when 2
    puts "MMCXXXIII арабськими цифрами:"
    puts roman_to_arabic("MMCXXXIII")
    puts "1990 римськими цифрами:"
    puts arabic_to_roman(1990)
  when 3
    puts "CLIX арабськими цифрами:"
    puts roman_to_arabic("CLIX")
    puts "3999 римськими цифрами:"
    puts arabic_to_roman(3999)
  when 4
    n = 0
    while true
      puts "Введіть число арабськими цифрами в діапазоні n >= 1 && n < 4000"
      n = gets.chomp
      if n.match?(/\A\d+\z/)
        n = n.to_i
        break if n >= 1 && n < 4000
      end
      puts "Некоректні дані, повторіть"
    end
    puts "Ваше число римськими цифрами:"
    puts arabic_to_roman(n)
  when 5
    roman = ""
    while true
      puts "Введіть число римськми цифрами в діапазоні n >= 1 && n < 4000"
      roman = gets.chomp
      if valid_roman_numeral?(roman)
        break
      else
        puts "Некоректні дані, повторіть"
      end
    end
    puts "Ваше число арабськими цифрами:"
    puts roman_to_arabic(roman)
  when 6
    puts "Вихід із програми."
    break
  else
    puts "Невірний вибір. Будь ласка, оберіть знову"
  end
end