RSpec.describe AddressBook do
  let(:book) {AddressBook.new}

    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eql expected_name
        expect(entry.phone_number).to eql expected_number
        expect(entry.email).to eql expected_email
      end


  context "attributes" do
    it "should respond to entries" do     
      expect(book).to respond_to(:entries)
    end

    it "should analyze entries as an array" do      
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(book.entries.size).eql? 0
      end
    end

  context ".add_entry" do
     it "adds only one entry to the address book" do          
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       
       expect(book.entries.size).eql? 1
     end

    it "adds the correct information to entries" do            
         book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
         new_entry = book.entries[0]
 
         expect(new_entry.name).eql? 'Ada Lovelace'
         expect(new_entry.phone_number).eql? '010.012.1815'
         expect(new_entry.email).eql? 'augusta.king@lovelace.com'
      end
     

  
    it "should confirm a single entry was removed from the address book" do       

      expect(book.entries.size).eql? 0 
    end
  end
  
   context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eql 5
    end

    it "checks the details of the first entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, "Bill","555-555-5555","bill@blocmail.com")
    end

      it "checks the details of the second entry" do
         book.import_from_csv("entries.csv")         
         entry_two = book.entries[1]

         check_entry(entry_two, "Bob","555-555-5555","bob@blocmail.com")
         
       end
   
       it "checks the details of the third entry" do
         book.import_from_csv("entries.csv")         
         entry_three = book.entries[2]

         check_entry(entry_three, "Joe","555-555-5555","joe@blocmail.com")
       end
   
       it "checks the details of the fourth entry" do
         book.import_from_csv("entries.csv")         
         entry_four = book.entries[3]

         check_entry(entry_four, "Sally","555-555-5555","sally@blocmail.com")        
       end

       it "checks the details of the fifth entry" do
         book.import_from_csv("entries.csv")         
         entry_five = book.entries[4]

         check_entry(entry_five, "Sussie","555-555-5555","sussie@blocmail.com")        
    end
end


context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size
      expect(book_size).to eql 3
    end
  
    it "checks the details of the sixth entry" do
      book.import_from_csv("entries_2.csv")
      entry_six = book.entries[0]

      check_entry(entry_six, "Collin","222-222-2222","collin@blocmail.com")
    end

    it "checks the details of the seventh entry" do
      book.import_from_csv("entries_2.csv")
      entry_seven = book.entries[1]

      check_entry(entry_seven,"Megan","333-333-3333","megan@blocmail.com")
    end

    it "checks the details of the eighth entry" do
      book.import_from_csv("entries_2.csv")
      entry_eight = book.entries[2]
      check_entry(entry_eight, "Muthia","111-111-1111","muthia@blocmail.com")
    end
  end

  describe ".binary_search" do 
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Dan")
       expect(entry).to be_nil
     end 

   it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bill")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Bill", "555-555-5555", "bill@blocmail.com")
     end
   

   it "searches AddressBook for Bob" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bob")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Bob", "555-555-5555", "bob@blocmail.com")
     end 
 
     it "searches AddressBook for Joe" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Joe")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Joe", "555-555-5555", "joe@blocmail.com")
     end 
 
     it "searches AddressBook for Sally" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sally")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Sally", "555-555-5555", "sally@blocmail.com")
     end 
 
     it "searches AddressBook for Sussie" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sussie")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Sussie", "555-555-5555", "sussie@blocmail.com")
     end

     it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Billy")
       expect(entry).to be_nil
     end
  end
end

   