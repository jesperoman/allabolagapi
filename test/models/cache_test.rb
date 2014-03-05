require 'test_helper'

class CacheTest < ActiveSupport::TestCase
  test 'should not save org nr without name' do
    cache = Cache.new({orgnr: '123456789'})
    assert !cache.save
  end
  test 'should not save name without org nr' do
    cache = Cache.new({name: 'Company'})
    assert !cache.save
  end
  test 'should not save nothing' do
    cache = Cache.new
    assert !cache.save
  end
  test 'should save correct' do
    cache = Cache.new({name: 'Company', orgnr: '123456789'})
    assert cache.save
  end


end
