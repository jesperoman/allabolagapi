require 'test_helper'

class CacheDummy
  extend AllabolagConnector
end

class AllabolagConnectorTest < ActionController::TestCase
  test 'extract data' do
    response = 'aksjdhkajshd§123456789/Mejsla title="Mejsla AB"'
    actual = CacheDummy.extract_data(response, 'mejsla')
    expected = {orgnr: '123456789', name: 'Mejsla AB'}
    assert_equal(actual, expected)
  end

  test 'not found' do
    response = 'xxx'
    assert_equal(CacheDummy.extract_data(response, 'Nisse'), {error: 'Nothing found'})
  end


  test 'should not search non alphanumeric' do
    assert_equal(CacheDummy.search('Öhman'), {error: 'Only alphanumeric characters and space allowed, a-zA-Z0-9.'})
  end

  test 'should fetch some response' do
    response = CacheDummy.fetch_response('ApoEx')
    assert_not_empty response
  end
end
