require 'active_record'
require './lib/product'
require './lib/cashier'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def open
  system('clear')
  puts "*****************************"
  puts "* A * VERITABLE * P * O * S *"
  puts "*****************************\n\n"
  user_menu
end

def user_menu
  puts "Just who do you think you are!?"
  puts "(m) 'Why I'm the manager!'"
  puts "(c) 'Just a lowly cashier."
  puts "(x) 'Who cares who I am; get me out of here!"
  identity = gets.chomp
  case identity
  when 'm'
    manager_menu
  when 'c'
    cashier_menu
  when 'x'
    puts "Goodbye. Come back as soon as you need more commerce in your life."
    exit
  end
end



def manager_menu
  manager_choice = nil
  until manager_choice == 'm'
    puts "What action would you like?"
    puts "(p) Enter a new product."
    puts "(c) Enter a new cashier."
    puts "(m) Return to the user menu."
    manager_choice = gets.chomp
    case manager_choice
    when 'p'
      new_product
    when 'c'
      new_cashier
    when 'm'
      puts "Goodbye, store manager."
    else
      puts "That is not a valid choice. Try again."
      manager_menu
    end
  end
  user_menu
end

def cashier_menu

end




open
