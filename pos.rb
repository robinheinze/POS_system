require 'active_record'
require './lib/product'
require './lib/cashier'
require './lib/transaction'
require './lib/transaction_item'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def boot_open
  system('clear')
  puts "\n\n\n\n                                         XXXX
                               .oo@@@oo.XXXXX
                         .o@@@@@@@@@@@@XXXXXo.
                        :@@@@:::::::::XXXXX@@@@.
                        :::::::::::::XXXXX:@@@@@@.
                       ::::::HHH:::::XXXX:::::::@@@.
                       :::::H:::H::::W::::HHH:::::@@@.
                      ::::H:::::H:::W::::H:::H:::::@@@
                      ::H:::*:::H:::W:::H:::::H:::::@
                     :H:::**:::H:::W:::H:::*:::H::::
                     :::*++*:::H:::W:::H:::**:::H::
                    :::*++*:::H:::W:::H:::*+*:::H:
                    :::*++*:::H:::W:::H:::**:::H:
                   :::*++*:::H:::W:::H:::*+*:::H
                   :::*++*:::H:::W:::H:::*+*:::
                  :::*++*:::H:::W:::H:::*+*:::
                  :::*++*:::H:::W:::H:::**:::
                 _--~~~~---__::W:::H:::**:::
      @ @ @     /            ~~W_::H:::**/(
     @ \\|/ @###(###########(### ##-_:::*|  \\
     @ /|\\ @~~~\\~~~~~~~~~~~~~~#     ~-_:\\   \\
      @ @ @     ===============        ~'    \\
                  ============= \\             \\__
                    ===========    \\             ~~~---____---
                      =========      \\                      _~
                        =======        \\________________--~~"
  puts "\n\t\tPress Enter to start Cowboy POS"
  gets
  user_menu
end

def user_menu
  system('clear')
  puts "\t\t*****************************"
  puts "\t\t* A * VERITABLE * P * O * S *"
  puts "\t\t*****************************\n\n"
  puts '                         oooo     oooo
                       o$$"""$oo$$"""""$o
                      $"      $$"      $$$$
                     $"      ""        $$$$$o
                     $                  $$$$$o
                    $                    $$$$$$
                   $"                    "$$$$$
                   $                      $$$$$$
                  $"                      $$$$$$
                  $                        $$$$$
                  $                       o$$$$$
                  $                       $$$$$$
                  $                      o$$$$$$
               ooo                      o$$$$$$$
       ooo$$$$"" $                   oo$$$$$""""""oooo
    oo"$$$$$$$ oo"" oooooooooooooooo$$"""           o$$"oo
   o"  $$$$$$$ "$o           oo$$$$$"               $$$$o"$o
  $    $$$$$$$  " ""oooooooooo$$$$"         o$      $$$$$$o"$
 o     $$""               oo$$$"           o$$     o$$$$$$$o$
 "o    $$             oo$$$$""            o$$$   o$$$$$$$$$$$
  "$o  $$$oo                           $$$$$$$   ooo$$$$$""
    "$$oooo ""            ooo$$$$      $$$$$$$$$$$$$$""
        """"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$""""""
                  """"""""""""""""""'
  puts "\nJust who do you think you are!?"
  puts "(m) 'Why I'm the manager!'"
  puts "(c) 'Just a lowly cashier."
  puts "(x) 'Who cares who I am; get me out of here!"
  identity = gets.chomp
  case identity
  when 'm'
    manager_menu
  when 'c'
    cashier_login
  when 'x'
    puts "Goodbye. Come back as soon as you need more commerce in your life."
    exit
  end
end



def manager_menu
  manager_choice = nil
  until manager_choice == 'm'
    system('clear')
    puts "@@@@@@@@@@@@@@@@"
    puts "@ Manager Menu @"
    puts "@@@@@@@@@@@@@@@@\n"
    puts "                                                 #    #
                                            %%% ##   ##
                                         %%%%% ###%%###
                                        %%%%% ### %%% #
                                      %%%%%% ### %%% ###
                                       %%%% ## %% #######
                                      %%%%% # %% #O#####
                                    %%%%%% # % #########
                                   %%%%% ##### #########
                         ###        %% ####### #########
                %%% ############    ########### ########
             %%%% ############################### #######
           %%%%% ################################## ######
         %%%%%% #################################### #C###
        %%%%%% #####################################  ###
        %%%%% #######################################
       %%%%%% ########################################
    % %%%%%%% ########################################
     %%%%%%%%% #######################################
    %%%%%%%%%% ########################################
 %%% %%%%%%%%   ###### ################################
   %%%%%%%%      ###### #################### ##########
% %%%%%%%%        ####### ########### ###### ##########
 %%%%%%%%%         #######  ########### ###### ########
%%%%%%%%%%          ##### ###  ######### ####### ######
 %%%%%%%%%%          #### ##               ####### ####
 %%%%%%%%%%%           ## #                  ##### ###
  %%  %% % %%         # ##                      ## ###
    %   %    %        # ###                      # ###
                       # ###                     ## ###
                       # ###                     ## ###
                       # ####                   #### ##
                      ### ###                  ##### ###
                     ####  ###                 ####   ##
                    #####   ###                 ##    ##
                   #####    ####                      ###
                    ##        ###                     ###
                               ####                     ##
                                ####                    ###
                                                        ####
                                                         ##"
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

def new_product
  system('clear')
  puts "\t\t=================================="
  puts "\t\t= Oh = Boy! = A = New = Product! ="
  puts "\t\t==================================\n\n"
  puts "What is the name of the new product?"
  product_name = gets.chomp
  puts "What is the unit price for #{product_name}?"
  unit_price = gets.chomp.to_f
  product = Product.create({:name => product_name, :price => unit_price})
end

def new_cashier
  system('clear')
  puts "\t\t#######################################"
  puts "\t\t# Good # Gracious # A # New # Cashier #"
  puts "\t\t#######################################\n\n"
  puts 'What is the non-denominational name of this cashier?'
  cashier_name = gets.chomp
  cashier = Cashier.create({:name => cashier_name})
end

def cashier_login
  system('clear')
  puts "\t\t$$$$$$$$$$$$$$$$$$$"
  puts "\t\t$ CASHIER $ LOGIN $"
  puts "\t\t$$$$$$$$$$$$$$$$$$$\n\n"
  puts '                /||\
                ||||
                ||||
                |||| /|\
           /|\  |||| |||
           |||  |||| |||
           |||  |||| |||
           |||  |||| d||
           |||  |||||||/
           ||b._||||~~"
           \||||||||
            "~~~||||
                ||||
                ||||
~~~~~~~~~~~~~~~~||||~~~~~~~~~~~~~~
  \/..__..--  . |||| \/  .  ..
\/         \/ \/    \/
        .  \/              \/    .
. \/             .   \/     .
   __...--..__..__       .     \/
\/  .   .    \/     \/    __..--..'
  puts "\nHowdy, valued employee! Please your employee id below. If you have forgotten your id, enter 'forgetful' to display the employee ids."
  cashier_id = gets.chomp
  if cashier_id == 'forgetful'
    display_cashiers
    puts "Now please enter your id number, forgetful yet still valued employee."
    cashier_id = gets.chomp
  end
  begin
    cashier = Cashier.find_by! id: cashier_id
  rescue
    puts "That's an invalid employee id, pardner! Hit Enter to get back on that bronc and try again!"
    gets
    cashier_login
  else
    cashier_menu(cashier)
  end
end

def display_cashiers
  cashiers = Cashier.all
  cashiers.each { |cashier| puts cashier.id.to_s + ": " + cashier.name }
end

def cashier_menu(cashier)
  menu_choice = nil
  until menu_choice == 'l'
    system('clear')
    puts "\t\t$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "\t\t$ COWBOY $ POS $ SYSTEM $"
    puts "\t\t$ Cashier: #{cashier.name} $"
    puts "\t\t$$$$$$$$$$$$$$$$$$$$$$$$$\n\n"
    puts "Enter (n) to make a new sale."
    puts "Enter (l) to logout."
    menu_choice = gets.chomp
    case menu_choice
    when 'n'
      new_sale(cashier)
    when 'l'
      puts "Adios, valued employee pardner!"
    else
      puts "That's an invalid menu choice, hombre!"
    end
  end
  user_menu
end

def new_sale(cashier, sale = nil)
  sale_option = nil
  if sale == nil
    sale = Transaction.create({:cashier_id => cashier.id})
  end
  until sale_option == 'f'
    system('clear')
    if !sale.nil?
      sale.reload
      puts "Your current bill is: \n"
      show_receipt(cashier, sale)
    end

    puts "\nEnter a product number to add it to the sale, or 'p' to list products."
    puts "Enter 'f' to finalize the sale."
    sale_option = gets.chomp
    case sale_option
    when 'p'
      list_products
      puts "Enter the a product number to add to the sale."
      sale_option = gets.chomp.to_i
      begin
        current_product = Product.find_by! id: sale_option
      rescue
        puts "That was not a valid product code. Please try again"
        new_sale(cashier, sale)
      else
        sale_item = sale.transaction_items.create(:product_id => current_product.id)
        puts "Enter the quantity of #{current_product.name}: "
        quantity = gets.chomp.to_i
        sale_item.update(:quantity => quantity)
      end
    when 'f'
      puts "Sale complete."
    else
      begin
        current_product = Product.find_by! id: sale_option
      rescue
        puts "That was not a valid product code. Please try again"
        new_sale(cashier, sale)
      else
        sale_item = sale.transaction_items.find_by(:product_id => current_product.id)
        if sale_item.nil?
          sale_item = sale.transaction_items.create(:product_id => current_product.id)
          quantity = 0
        else
          quantity = sale_item.quantity
        end
        puts "Enter the quantity of #{current_product.name}: "
        new_quantity = gets.chomp.to_i
        sale_item.update(:quantity => quantity + new_quantity)
      end
    end

  end
  system('clear')
  puts "Here is your final receipt: \n"
  show_receipt(cashier, sale)
  gets
end

def list_products
  products = Product.all
  products.each { |product| puts "ID: #{product.id}, #{product.name}, $#{product.price}/unit"}
end

def show_receipt(cashier, sale)
  # system('clear')
  puts "\t\t*****************"
  puts "\t\t***  RECEIPT  ***"
  puts "\t\t*   Sale No: #{sale.id}  *"
  puts "\t\t*****************\n\n"

  line_items = sale.transaction_items.order(:id)
  total = 0.00
  line_items.each do |item|
    puts "#{item.product.name}: x#{item.quantity} ---- $#{sprintf('%.2f', (item.product.price * item.quantity))}"
    total += item.product.price * item.quantity
  end
  puts "\t\tTotal: \t$#{sprintf('%.2f', total)}"
end


boot_open
