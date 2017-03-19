def generate_choices(choices, constrained_prompt)
  options = []

  if constrained_prompt
    choices.each.with_index(1) do |choice, index|
      puts "#{index}. ", choice
      options.push(index)
    end
  else
    choices.each { |choice| puts choice }
  end

  options
end

def get_choice(options, constrained_prompt)
  bad_input = true

  while bad_input
    print '>'
    choice = $stdin.gets

    if options.include? choice.to_i
      bad_input = false
    elsif !constrained_prompt

      if choice =~ /^\d+$/
        bad_input = false
      else
        puts 'Man, learn to type a number!'
      end

    else
      puts 'Don\'t recognize that choice. Choose again!'
    end

  end

  choice.chomp.to_i
end

def prompt(description, choices, constrained_prompt)
  description.each { |line| puts line }

  options = generate_choices(choices, constrained_prompt)

  get_choice(options, constrained_prompt)
end

choice = prompt(['You enter a dark room.'], %w(right left), true)

puts choice
puts choice.class

choice = prompt(['Some stuff'], ['How much do you take?'], false)

puts choice
puts choice.class
