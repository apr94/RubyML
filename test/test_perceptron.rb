require 'minitest/autorun'
require 'rubyml'
require 'coveralls'
Coveralls.wear!

class PerceptronTest < Minitest::Test
  def test_initialize
    p = Perceptron.new(20, 10)
    assert_equal 20, p.iterations
    assert_equal 10, p.folds
  end

  def test_setup_weights
    p = Perceptron.new(20, 10)
    p.setup_weights(Matrix.rows([%w(lbl1 lbl2 lbl1)]))
    assert_equal p.labels, %w(lbl1 lbl2)
  end

  def test_fit
    p = Perceptron.new(20, 10)
    p.fit(Matrix.rows([[1, 1], [-1, -1]]), Matrix.columns([%w(pos neg)]))
    assert_equal p.weights['pos'][0], 1
    assert_equal p.weights['neg'][1], -1
  end

  def test_predict
    p = Perceptron.new(20, 10)
    p.fit(Matrix.rows([[1, 1], [-1, -1]]), Matrix.columns([%w(pos neg)]))
    assert_equal Matrix.rows([['pos']]), p.predict(Matrix.rows([[0.9, 1.1]]))
  end

  def test_cold_start
    p = Perceptron.new(20, 10)
    p.fit(Matrix.rows([[1, 1], [-1, -1]]), Matrix.columns([%w(pos neg)]))
    p.cold_start
    assert_equal p.labels, []
    assert_equal p.weights, {}
  end
end
