require 'active_support/all'

require 'rspec/autorun'
require 'memcached'

class Taller

#test_add
def testAdd
cache=Memcached.new("localhost:11211") 
cache.add 'Addkey', 'Valuek1'

cache.get 'Addkey'
end
#test_set_get
def set_get
cache=Memcached.new("localhost:11211") 
cache.set 'key', 'Value155'
cache.get 'key'

end

# test_replace

def test_replace
cache=Memcached.new("localhost:11211") 
cache.set 'key5', 'Value5'
cache.replace 'key5','NewValue5'
cache.get 'key5'
end
#test_append
def test_append
cache=Memcached.new("localhost:11211") 
cache.set 'keyAppend', 'valueAppend1'
cache.append 'keyAppend', 'valueAppend2'
cache.get 'keyAppend'
end
#test_prepend
def test_prepend
cache=Memcached.new("localhost:11211") 
cache.set 'keyPrepend','ValuePrepend1'
cache.prepend 'keyPrepend','ValuePrepend2'
cache.get 'keyPrepend'
end
#test_delete
def test_delete
cache=Memcached.new("localhost:11211") 
cache.set 'keyDelete', 'valueDelete'
cache.delete 'keyDelete'

cache.get 'keyDelete'

end
#test_ExpiredKey
def test_ExpiredKey
cache=Memcached.new("localhost:11211") 
cache.add 'keyExpired','valueExpired',1
#sleep(60)                                                     #WE NEED TO ACTIVATE THIS LINE TO BE ABLE TO PERFORM THE EXPIRY TEST
cache.get 'keyExpired'
end
# test_flush_all
def test_flush_all
cache=Memcached.new("localhost:11211") 
cache.flush_all '10'
end

#test_cas
def test_cas
cache=Memcached.new("localhost:11211") 
cache.set 'casKey','casValue',0,900,8
cache.cas 'casKey','casValue1',0,900,1
cache.get 'casKey'
end


	
def test_gets
cache=Memcached.new("localhost:11211") 
cache.set 'keyGets1','valuegets1'
cache.set 'keyGets2','valueGets2'

cache.gets 'keyGets1' ,'keyGets2'

end

 


end
describe Taller do
	
		it "Prueba Add" do 
			expect(Taller.new.testAdd).to eq("Valuek1")
	end
end

describe Taller do
	
		it "Prueba Get_Set" do 
			expect(Taller.new.set_get).to eq("Value155")
		end
	end




describe Taller do
	
		it "Prueba Replace" do 
			expect(Taller.new.test_replace).to eq("NewValue5")
	end
end

describe Taller do
	
		it "Prueba Append" do 
			expect(Taller.new.test_append).to eq("valueAppend1")
	end
end

describe Taller do
	
		it "Prueba Prepend" do 
			expect(Taller.new.test_prepend).to eq("ValuePrepend2")
	end
end

describe Taller do
	
		it "Prueba ExpiredKey" do 
			expect(Taller.new.test_ExpiredKey).to eq("valueExpired")
			
			
			
			end
	end
	
describe Taller do
	
		it "Prueba Gets" do 
			expect(Taller.new.test_gets).to eq("valuegets1","valueGets2")
		
		end
		
		

end

