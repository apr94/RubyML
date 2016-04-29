require 'minitest/autorun'
require 'rubyml'
require 'coveralls'
Coveralls.wear!

class LinearRegressionTest < Minitest::Test
  def test_initialize
    l = LinearRegression.new(2, 10)
    assert_equal 2, l.precision
    assert_equal 10, l.folds
  end

  def test_fit
    l = LinearRegression.new
    rml = RubyML.new
    data = rml.load_data('test/data/testdata2', false)
    x, y = rml.separate_data(data)
    l.fit(x, y)
    assert_equal Matrix.columns([[5.0, 1.2]]), l.theta
  end

  def test_predict
    l = LinearRegression.new
    rml = RubyML.new
    data = rml.load_data('test/data/testdata2', false)
    x, y = rml.separate_data(data)
    l.fit(x, y)
    assert_equal Matrix.rows([[14.6]]), l.predict(Matrix.rows([[8.0]]))
  end
end
