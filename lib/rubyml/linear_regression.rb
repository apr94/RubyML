require 'rubyml/tools'

# The linear regression class with
# customizable number of folds for
# K-fold cross validation.
class LinearRegression
  include Tools::DataMethods
  include Tools::ClassifierMethods
  attr_reader :theta, :accuracy, :precision, :folds

  def initialize(precision = 3, folds = 5)
    @precision = precision
    @epsilon = 2.0
    @folds = folds
  end

  def fit(x, y)
    x_mat = bias_trick(x)
    @theta = ((x_mat.t * x_mat).inv * x_mat.t) * y
    @theta = @theta.collect { |e| e.round(@precision) }
  end

  def predict(x)
    x_mat = bias_trick(x)
    (x_mat * @theta).collect { |e| e.round(@precision) }
  end
end
