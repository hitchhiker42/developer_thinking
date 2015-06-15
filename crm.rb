# As a user I shoudl eb able to add a contact
# I should be able to search, edit, delete, have multiple contacts for one person
# copy a contact, share, take action on contact, add a picture

require_relative('rolodex.rb')

class CRM
	
	attr_reader :name

	def self.run(name) #CLASS LEVEL METHODS YO. attaches run to CRM method
		my_crm = CRM.new(name) # can just say CRM.new coz its attached to class 
		my_crm.main_menu
		# when call .new on class, it initializes in the background
	end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new  #doesn't this create a new one everytime then?
	end

	def print_main_menu
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Display all contacts"
		puts "[4] Display an attribute"
		puts "[5] Delete a contact"
		puts "[6] Exit"
		#gets.chomp  #dont have to set it to a variable coz its local and last line is returned
	end

	def choose_option(choice)
		# print "Select an option:" #using puts adds a new line
		# input = gets.chomp.to_i  
		# cut and move this later 

		case choice
		when 1 then add_contact
		when 2 then edit_contact
		when 3 then display_contacts
		when 4 then display_attributes
		when 5 then delete_contact
		when 6 then 
			print "goodbye"
			exit
		else
			puts "Can't do dat"
		end
	end

	def main_menu
		puts "Welcome to #{@name}"
		while true
			print_main_menu

			print "Select an option:"
			input = gets.chomp.to_i

			# return if input== 6 leave this with choose_option method so responsibility
									# of methods clearly delineated
		
			choose_option(input)	
		end
	end

	def add_contact #add contacts to a class coz you want to make each person a separate obj
		# put new class in separate files
		puts "Adding a contact"

		print "First name: "
		first_name = gets.chomp

		print "Last name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Notes: "
		notes = gets.chomp


		@rolodex.add_contact(first_name, last_name, email, notes)
	end

	def edit_contact
		display_attributes
		puts " choose the id of the contact you would like to edit"
		chosen_contact = gets.chomp.to_i
		
		puts "which category would you like to edit?
		Choose the number of the cateogory you would like to change:
		[1] First Name 
		[2] Last Name
		[3] Email
		[4] Notes"
		category = gets.chomp.to_i

		puts "What would you like to change it to"
		new_info = gets.chomp

		case category
		when 1 then @rolodex.update_fname(chosen_contact, new_info)
		when 2 then @rolodex.update_lname(chosen_contact, new_info)
		when 3 then @rolodex.update_email(chosen_contact, new_info)
		when 4 then @rolodex.update_notes(chosen_contact, new_info)
		end
		main_menu
	end

	def display_contacts
		@rolodex.all.each do |cont| 
			puts "#{cont.first_name}"
		end
	end

	def display_attributes
		@rolodex.all.each do |cont|
			puts "#{cont.id} #{cont.first_name} #{cont.last_name} #{cont.email} #{cont.notes}"
		end
	end

	def delete_contact
		display_attributes
		puts "select the id of the person you would like to delete"
		remove_id = gets.chomp.to_i
		@rolodex.remove_contact(remove_id)
	end


	end

CRM.run("first")
