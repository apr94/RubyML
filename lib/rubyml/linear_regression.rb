require 'rubyml/tools'

class LinearRegression
  include Tools::DataMethods
  attr_reader :theta, :accuracy

  def initialize(precision = 3)
    @precision = precision
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
