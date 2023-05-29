class Main
  def welcome
    puts
    puts
    puts 'Welcome to Catalog of My Things. Please select an option:'
    puts '1 --> List all Books'
    puts '2 --> List all Music Albums'
    puts '3 --> List all Movies'
    puts '4 --> List all Games'
    puts '5 --> List all Genres'
    puts '6 --> List all Labels'
    puts '7 --> List all Authors'
    puts '8 --> List all Sources'
    puts '9 --> Add a Book'
    puts '10 --> Add a Music Album'
    puts '11 --> Add a Movie'
    puts '12 --> Add a Game'
    puts 'PRESS 0 TO EXIT'
    puts '----------------------'
    print 'Enter your choice: '
    choice = gets.chomp.to_i
    execute_actions(choice)
  end

  def execute_actions(choice)
    case choice
    when 0
      puts 'Goodbye!'
      exit
    when 1 then puts 'Listing all Books'
    when 2 then puts 'Listing all Music Albums'
    when 3 then puts 'Listing all Movies'
    when 4 then puts 'Listing all Games'
    when 5 then puts 'Listing all Genres'
    # when 6 then puts 'Listing all Labels'
    # when 7 then puts 'Listing all Authors'
    # when 8 then puts 'Listing all Sources'
    # when 9 then puts 'Add a Book'
    # when 10 then puts 'Add a Music Album'
    # when 11 then puts 'Add a Movie'
    # when 12 then puts 'Add a Game'
    else
      puts 'Invalid input. Please try again.'
      welcome
    end
  end
end

app = Main.new
app.welcome
