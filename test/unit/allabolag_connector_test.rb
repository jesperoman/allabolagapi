require "test_helper"

class CacheDummy
  extend AllabolagConnector
end

class AllabolagConnectorTest < ActionController::TestCase
  test "extract data" do
    response = "aksjdhkajshd§123456789/Mejsla title=\"Mejsla AB\""
    assert_equal(CacheDummy.extractdata(response, "Mejsla"), {orgnr: "123456789", name: "Mejsla AB"})
  end
  test "not found" do
    response = "xxx"
    assert_equal(CacheDummy.extractdata(response, "Nisse"), {error: "Nothing found"})
  end
  test "fetch from url" do
    # how to?
    assert true
  end
end
