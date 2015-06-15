require_relative('contact.rb')

class Rolodex
@@id = 1 #so no rolodexes have duplicate IDs

	def initialize
		@contacts = []
	end

	def add_contact(first_name,last_name,email, notes)
		contact = Contact.new(@@id, first_name, last_name, email, notes)
		@@id += 1

		@contacts << contact
	end

	def contact_info(chosen_contact)
		@contacts.find { |x| x.id == chosen_contact }
	end

	def update_fname(chosen_contact, new_info)
		c = contact_info(chosen_contact)
		c.first_name = new_info
		puts @contacts 
	end

	def update_lname(chosen_contact, new_info)
		c = contact_info(chosen_contact)
		c.last_name = new_info
		# puts c.last_name
	end

	def update_email(chosen_contact, new_info)
		c = contact_info(chosen_contact)
		c.email = new_info
		# puts c.email
	end

	def update_notes(chosen_contact, new_info)
		c = contact_info(chosen_contact)
		c.notes = new_info
		# puts c.new_info
	end

	def remove_contact(remove_id)
		c = contact_info(remove_id)
		@contacts.delete(c)
	end

	def all
		@contacts		
	end
end