require 'minitest/autorun'
require 'rubyml'
require 'coveralls'
Coveralls.wear!

class RubyMLTest < Minitest::Test
  def test_load_data
    rml = RubyML.new
    data = rml.load_data('test/data/testdata1', true)
    rows = [['6.0', '2.2', 'iris-versicolor'],
            ['6.9', '3.1', 'iris-virginica'],
            ['5.5', '2.4', 'iris-versicolor']]
    mat = Matrix.rows(rows)
    assert_equal mat, data
  end
end
