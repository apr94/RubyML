require 'rubyml/tools'

class Perceptron
  include Tools::DataMethods

  def initialize(iterations = 100)
    @iterations = iterations
    @labels = []
    @weights = {}
  end

  def setup_weights(y)
    @labels = mat_to_array(y).uniq { |e| e }
    @labels.each { |lbl| @weights[lbl] = Hash.new(0) }
  end

  def update_weights(guess, real, c, w)
    @weights[guess][c] -= w
    @weights[real][c] += w
  end

  def fit(x, y)
    setup_weights(y)
    @iterations.times do
      x.row_count.times do |r|
        clbl = get_best_guess(x, r)
        next unless y[r, 0] != clbl
        x.column_count.times { |c| update_weights(clbl, y[r, 0], c, x[r, c]) }
      end
    end
  end

  def predict(x)
    preds = []
    x.row_count.times { |r| preds << get_best_guess(x, r) }
    Matrix.columns([preds])
  end

  def get_best_guess(x, r)
    clbl, cmax = nil
    @labels.each do |lbl|
      csum = 0.0
      x.column_count.times { |c| csum += @weights[lbl][c] * x[r, c] }
      if cmax.nil? || cmax <= csum
        cmax = csum
        clbl = lbl
      end
    end
    clbl
  end

  def cold_start
    @labels = []
    @weights = {}
  end

  def training_accuracy(x, y)
  end
end
