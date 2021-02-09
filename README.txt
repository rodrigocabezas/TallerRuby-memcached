###HOW TO INSTALL MEMCACHED
sudo apt-get install -y memcached libmemcached-tools

#### Server
A memcached server can be quickly deployed using the following command on the console:
$ telnet localhost 112211
 
SERVER RUBY:
 require 'active_support/all'
require 'memcached'

#test_add
def testAdd
cache=Memcached.new("localhost:11211") 
cache.add 'Addkey','Valuek1'
cache.add 'Addkey','newAddkey'

end
#test set_get
def set_get
cache=Memcached.new("localhost:11211") 
cache.set 'key', 'Value155'
cache.get 'key'

end
# test_replace

def test_replace
cache=Memcached.new("localhost:11211") 
cache.set 'key5', 'Value5'
cache.replace 'key5', 'NewValue5'
end
#test_append
def test_append
cache=Memcached.new("localhost:11211") 
cache.set 'keyAppend','valueAppend1'
cache.append 'keyAppend','valueAppend2'
cache.get 'keyAppend'
end
#test_prepend
def test_prepend
cache=Memcached.new("localhost:11211") 
cache.set 'keyPrepend','valuePrepend'
cache.prepend 'keyPrepend','valuePrepend1'
cache.get 'keyPrepend'

end
#test_delete
def test_delete
cache=Memcached.new("localhost:11211") 
cache.set 'keyDelete','valueDelete'
cache.delete 'keyDelete'

cache.get 'keyDelete'

end
#test_ExpiredKey
def test_ExpiredKey
cache=Memcached.new("localhost:11211") 
cache.set 'keyExpired', 'valueExpired',1
cache.get 'keyExpired'
end


#test_cas
def test_cas
cache=Memcached.new("localhost:11211") 
cache.set 'casKey','cas'
cache.cas 'casKey', 'casValue'
cache.get 'casKey'
end
#TEST_GETS
def test_gets
cache=Memcached.new("localhost:11211") 
cache.set 'keyGets1','valuegets1'
cache.set 'keyGets2','valueGets2'

cache.gets 'keyGets1' ,'keyGets2'

end
testAdd
set_get
test_replace
test_append
test_prepend
test_delete
test_ExpiredKey
test_gets
test_cas

HOW TO RUN RUBY:
cd TallerRuby
ruby TallerRuby.rb
When the ruby ​​server is running, you can check if the queries on the memcached server work.

####TEST RUBY/RSPEC
Need GEM Rspec
require 'active_support/all'
require 'rspec/autorun'
require 'memcached'

####HOW TO RUN TEST RUBY/RSPEC
IN TERMINAL UBUNTU:
cd TallerRuby
ruby RspecTest.rb


###Finally, to control the number of simultaneous clients, configure the -c command of the cache configuration by entering sudo gedit /etc/memcached.conf
