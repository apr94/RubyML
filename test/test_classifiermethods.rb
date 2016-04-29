require 'minitest/autorun'
require 'rubyml'
require 'coveralls'
Coveralls.wear!

class ClassifierMethodsTest < Minitest::Test
  def test_generate_folds
    rml = RubyML.new
    data = rml.load_data('test/data/testdata1', true)
    x, y = rml.separate_data(data)
    p = Perceptron.new(100, 3)
    xtrain, ytrain, xtest, ytest = p.generate_folds(x, y, 1, 3)
    assert_equal ytest, y['1', ':']
    assert_equal xtest, x['1', ':']
    assert_equal ytrain, y['0', ':'].vstack(y['2', ':'])
    assert_equal xtrain, x['0', ':'].vstack(x['2', ':'])
  end
end
