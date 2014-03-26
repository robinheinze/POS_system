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
    puts "(t) View total sales for a given time period."
    puts "(v) View each cashier's transaction history for a given time period."
    puts "(s) View sales rates for our products."
    puts "(r) View return rates for our products"
    puts "(m) Return to the user menu."
    manager_choice = gets.chomp
    case manager_choice
    when 'p'
      new_product
    when 'c'
      new_cashier
    when 't'
      total_sales
    when 'v'
      cashier_history
    when 's'
      sales_rates
    when 'r'
      return_rates
    when 'm'
      puts "Goodbye, store manager."
    else
      puts "That is not a valid choice. Try again."
      manager_menu
    end
  end
  user_menu
end

def sales_rates
  system('clear')

  puts "\n                    **
                  '**'''
                  .'
                 **    .**
                  '*.***''
          ..        ***.
         ***.       *****
         **''.      ***'*
         *' .*.... .***  *
         *  ***********...''
        .' ****************.
        '   ******************..
            *****'*************..
          .**'**' ***************'
           ''***   '''************
             **''.    '**  *'*****.
              '* '     **  *  *****
                *.     '*  * ******.
                 *.     **  ****'
                         * '**'
                         *"
  puts "\nHere are the sales figures for all of our fabulous products.\n\n"

  Product.all.each do |product|
    total_sales = product.total_quantity
    puts "Product number #{product.id}. #{product.name}: #{total_sales} units sold."
  end

  puts "\nPress enter to return to the manager menu."
  gets
end

def return_rates
  system('clear')
  puts "\n"
  puts '                          /|                        /|
                          | \           __ _ _     / ;
                    ___    \ \   _.-"-" `~"\  `"--` /
                _.-`   ""-._\ ""   ._,"  ; "\"--._./
            _.-`       \./    "-""", )  ~"  |
           / ,- .`          ,     `  `o.  ;  )
           \ ;/       `                 ;   /
            |/        `      |      \   `   |
            /        |             J."\  ,  |
           "         :       \   .`  : | ,. _)
           |         |     /     f |  |`--"--`
            \_        \    \    / _/  |
             \ "-._  _.|   (   j/; -`/
              \  | "/  (   |   /,    |
               | \  |  /\  |\_///   /
               \ /   \ | \  \  /   /
                ||    \ \|  |  |  |
                ||     \ \  |  | /
                |\      |_|/   ||
                L \       ||   ||
                `"`       |\   |\
                          ( \. \ `.
                          |_ _\|_ _\
                            "    "'
  puts "\nHere are the return figures for all of our fabulous products.\n\n"

  Product.all.each do |product|
    total_returns = product.total_returned
    puts "Product number #{product.id}. #{product.name}: #{total_returns} units returned."
  end

  puts "\nPress enter to return to the manager menu."
  gets
end

def total_sales
  system('clear')
  puts '  ______________________________________________________________________
  |.============[_F_E_D_E_R_A_L___R_E_S_E_R_V_E___N_O_T_E_]=============.|
  ||%&%&%&%_    _        _ _ _   _ _  _ _ _     _       _    _  %&%&%&%&||
  ||%&.-.&/||_||_ | ||\||||_| \ (_ ||\||_(_  /\|_ |\|V||_|)|/ |\ %&.-.&&||
  ||&// |\ || ||_ \_/| ||||_|_/ ,_)|||||_,_) \/|  ||| ||_|\|\_|| &// |\%||
  ||| | | |%               ,-----,-"____"-,-----,               %| | | |||
  ||| | | |&% """"""""""  [    .-;"`___ `";-.    ]             &%| | | |||
  ||&\===//                `)." ."`_.- `.  ".".(`  A 76355942 J  \\\\===/&||
  ||&%"-"%/1                // ." /`     \    \\\\                  \%"-"%||
  ||%&%&%/`   d8888b       // /   \  _  _;,    \\\\      .-"""-.  1 `&%&%%||
  ||&%&%&    8P |) Yb     ;; (     > a  a| \    ;;    //A`Y A\\\\    &%&%&||
  ||&%&%|    8b |) d8     || (    ,\   \ |  )   ||    ||.-"-.||    |%&%&||
  ||%&%&|     Y8888P      ||  "--"/`  -- /-"    ||    \\\\_/~\_//    |&%&%||
  ||%&%&|                 ||     |\`-.__/       ||     "-...-"     |&%&%||
  ||%%%%|                 ||    /` |._ .|-.     ||                 |%&%&||
  ||%&%&|  A 76355942 J  /;\ _."   \  } \  "-.  /;\                |%&%&||
  ||&%.-;               (,  ".      \  } `\   \"  ,)   ,.,.,.,.,   ;-.%&||
  ||%( | ) 1  """""""   _( \  ;...---------.;.; / )_ ```""""""" 1 ( | )%||
  ||&%"-"==================\`------------------`/=================="-"%&||
  ||%&JGS&%&%&%&%%&%&&&%&%%&)O N E  D O L L A R(%&%&%&%&%&%&%%&%&&&%&%%&||
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""`'
  puts "\n\nEnter the starting date for which you want to view total sales."
  start_date_input = gets.chomp
  start_date = Date.parse start_date_input
  puts "Enter the ending date for which you want to view total sales."
  end_date_input = gets.chomp
  end_date = Date.parse end_date_input
  total = TransactionItem.sales_over_period(start_date, end_date)
  puts "The total sales over the period #{start_date.to_s} to #{end_date} was $#{sprintf('%.2f', total)}"
  puts "Enter (a) to view total sales over another time period, or anything else to return to the main manager menu."
  navigation_choice = gets.chomp
  if navigation_choice == 'a'
    total_sales
  end
end

def cashier_history
  system('clear')
  puts "\n\nEnter the starting date for which you want to view cashier history."
  start_date_input = gets.chomp
  start_date = Date.parse start_date_input
  puts "Enter the ending date for which you want to view cashier history."
  end_date_input = gets.chomp
  end_date = Date.parse end_date_input
  puts "\nFor the time period #{start_date} to #{end_date}:\n"

  Cashier.all.each do |cashier|
    puts "#{cashier.name}: #{cashier.total_transactions} transactions."
  end

  puts "\nEnter 'a' to view cashier history for another time period, or anything else to return to the main manager menu."
  cashier_history_choice = gets.chomp
  if cashier_history_choice == 'a'
    cashier_history
  end
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
    puts "Enter (r) to process a return"
    puts "Enter (l) to logout."
    menu_choice = gets.chomp
    case menu_choice
    when 'n'
      new_sale(cashier)
    when 'r'
      process_return(cashier)
    when 'l'
      puts "Adios, valued employee pardner!"
    else
      puts "That's an invalid menu choice, hombre!"
    end
  end
  user_menu
end

def process_return(cashier)
  puts "Enter the transaction ID for which you will be processing a return. If you do not know the id, tough noogies."
  transaction_id = gets.chomp.to_i
  finished = false
  begin
    sale = Transaction.find_by!(:id => transaction_id)
  rescue
    puts "That was not a valid transaction id. Please try again."
    process_return(cashier)
  else
    until finished
      show_receipt(sale)
      puts "Enter the product code of the item being returned"
      product_id = gets.chomp.to_i
      item_to_return = sale.transaction_items.find_by(:product_id => product_id)
      ask_again = true
      while ask_again
        puts "Enter the qty to return"
        qty = gets.chomp.to_f
        if qty <= item_to_return.quantity
          ask_again = false
          item_to_return.update(:returned_quantity => qty)
          item_to_return.transaction.update(:return_flag => true)
        end
      end
      sale.reload
      puts "Product #{product_id} was successfully returned from transaction #{transaction_id}"
      show_receipt(sale)
      puts "Press 'a' to return another product from this transaction or any other key to return to the menu"
      user_choice = gets.chomp
      system('clear')
      if user_choice != 'a'
        finished = true
      end
    end
  end
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
      show_receipt(sale)
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
        new_sale(sale)
      else
        sale_item = sale.transaction_items.create(:product_id => current_product.id, :item_price_at_sale => current_product.price)
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
          sale_item = sale.transaction_items.create(:product_id => current_product.id, :item_price_at_sale => current_product.price)
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
  show_receipt(sale)
  gets
end

def list_products
  products = Product.all
  products.each { |product| puts "ID: #{product.id}, #{product.name}, $#{product.price}/unit"}
end

def show_receipt(sale)
  puts "\t\t*****************"
  puts "\t\t***  RECEIPT  ***"
  puts "\t\t*   Sale No: #{sale.id}  *"
  puts "\t\t*   Sales Associate: #{sale.cashier.name}  *"

  puts "\t\t*****************\n\n"

  if sale.return_flag
    puts "Modified Receipt:"
    line_items = sale.transaction_items.order(:id)
    total = 0.00
    line_items.each do |item|
      puts "No.#{item.product.id}, #{item.product.name}: x#{item.quantity - item.returned_quantity} ---- $#{sprintf('%.2f', (item.item_price_at_sale * (item.quantity - item.returned_quantity)))}"
      total += item.product.price * (item.quantity - item.returned_quantity)
    end
    puts "\t\tTotal: \t$#{sprintf('%.2f', total)}"
    puts "\n\nOriginal Receipt: "
  end

  line_items = sale.transaction_items.order(:id)
  total = 0.00
  line_items.each do |item|
    puts "No.#{item.product.id}, #{item.product.name}: x#{item.quantity} ---- $#{sprintf('%.2f', (item.item_price_at_sale * item.quantity))}"
    total += item.product.price * item.quantity
  end
  puts "\t\tTotal: \t$#{sprintf('%.2f', total)}"
end


boot_open
