require 'minitest/autorun'
require 'rubyml'
require 'coveralls'
Coveralls.wear!

class ClassifierMethodsTest < Minitest::Test
  def test_load_data
    rml = RubyML.new
    data = rml.load_data('test/data/testdata1', true)
    rows = [['6.0', '2.2', 'iris-versicolor'],
            ['6.9', '3.1', 'iris-virginica'],
            ['5.5', '2.4', 'iris-versicolor']]
    mat = Matrix.rows(rows)
    assert_equal mat, data
  end

  def test_separate_data
    rows = [['6.0', '2.2', 'iris-versicolor'],
            ['6.9', '3.1', 'iris-virginica'], ['5.5', '2.4', 'iris-versicolor']]
    data = Matrix.rows(rows)
    x, y = RubyML.new.separate_data(data)
    xrows = [[6.0, 2.2], [6.9, 3.1], [5.5, 2.4]]
    yrows = [['iris-versicolor'], ['iris-virginica'], ['iris-versicolor']]
    xdata = Matrix.rows(xrows)
    ydata = Matrix.rows(yrows)
    assert_equal x, xdata
    assert_equal y, ydata
  end

  def test_mat_to_array
    rml = RubyML.new
    mat = Matrix.rows([[1, 2], [3, 4]])
    assert_equal rml.mat_to_array(mat), [1, 2, 3, 4]
  end

  def test_bias_trick
    rml = RubyML.new
    mat1 = Matrix.rows([[1, 2], [3, 4]])
    mat2 = Matrix.rows([[1, 1, 2], [1, 3, 4]])
    assert_equal rml.bias_trick(mat1), mat2
  end
end
