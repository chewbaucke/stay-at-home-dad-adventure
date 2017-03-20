def generate_options(choices)
  options = []

  choices.each.with_index(1) do |choice, index|
    puts "#{index}. #{choice}"
    options.push(index.to_i)
  end

  options
end

def input_choice(choices)
  options = generate_options(choices)

  good_input = false

  until good_input
    print '>'
    choice = $stdin.gets

    if options.include? choice.chomp.to_i
      good_input = true

    else
      puts 'Don\'t recognize that choice. Choose again!'
    end

  end

  choice.chomp.to_i
end

def input_amount
  good_input = false

  until good_input
    print '>'
    input = $stdin.gets

    if input =~ /\A\d+\Z/
      good_input = true
    else
      puts 'Man, learn to type a number!'
    end
  end

  input.chomp.to_i
end

def get_choice(question, choices)
  puts question

  input_choice(choices)
end

def get_amount(question)
  puts question

  input_amount
end

def describe_room(description)
  description.each { |line| puts line }
end

describe_room(['You enter a dark room.', 'It\'s hard to see'])
choice = get_choice('which way?', %w(right left))

puts choice
puts choice.class

describe_room(['You found some stuff!'])
choice = get_amount('How much do you take?')

puts choice
puts choice.class
