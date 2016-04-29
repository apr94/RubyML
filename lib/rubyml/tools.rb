require 'matrix'
require 'gruff'

module Tools
  # Methods for loading and manipulating data.
  module DataMethods
    def load_data(file, text = false)
      mat = []
      File.foreach(file) do |f|
        mat << f.split(',').map { |i| text ? String(i).chomp : Float(i) }
      end
      Matrix.rows(mat)
    end

    def separate_data(data)
      col_vec = data.column_vectors
      y = Matrix.columns([col_vec.pop])
      x = Matrix.columns(col_vec).collect { |e| Float(e) }
      [x, y]
    end

    def mat_to_array(data)
      arr = []
      data.each { |e| arr << e }
      arr
    end

    def bias_trick(x)
      ones = Matrix.columns([[1] * x.row_count])
      x_bias = ones.hstack(x)
      x_bias
    end

    def plot_function(px, py, theta)
      fx = []
      fy = []
      1000.times do |i|
        fx << (px[0] + (px[-1] - px[0]) * Float(i) / 1000.0)
        fy << (fx[-1] * theta[1] + theta[0])
      end
      plot(fx, fy, px, py)
    end

    def plot(fx, fy, px, py)
      g = Gruff::Scatter.new(800)
      g.data(:data, px, py)
      g.data(:fit, fx, fy)
      g.write('scatter.png')
    end
  end

  # Methods to test classifier accuracy via
  # K-fold cross validation.
  module ClassifierMethods
    def generate_folds(x, y, num, folds)
      sin = String(num * (x.row_count / folds))
      ein = String([(num + 1) * (x.row_count / folds), x.row_count].min)
      train = generate_train_set(x, y, sin, ein)
      test = generate_test_set(x, y, sin, ein)
      train + test
    end

    def generate_train_set(x, y, sin, ein)
      xtrain = x[':' + sin, ':'].vstack(x[ein + ':', ':'])
      ytrain = y[':' + sin, ':'].vstack(y[ein + ':', ':'])
      [xtrain, ytrain]
    end

    def generate_test_set(x, y, sin, ein)
      xtest = x[sin + ':' + ein, ':']
      ytest = y[sin + ':' + ein, ':']
      [xtest, ytest]
    end

    def handle_epsilon(ypred, ytest, r)
      if @epsilon
        ((ypred[r, 0] - ytest[r, 0]).abs < @epsilon ? 1.0 : 0.0)
      else
        (ypred[r, 0] == ytest[r, 0] ? 1.0 : 0.0)
      end
    end

    def correct_count(ypred, ytest, c, t, n)
      count = 0.0
      ypred.row_count.times do |r|
        count += handle_epsilon(ypred, ytest, r)
      end
      p "Fold #{n} Accuracy: #{(count / ypred.row_count * 100.0).round(3)}%"
      [c + count, t + ypred.row_count]
    end

    def training_accuracy(x, y)
      correct = 0.0
      total = 0.0
      @folds.times do |n|
        xtrain, ytrain, xtest, ytest = generate_folds(x, y, n, @folds)
        fit(xtrain, ytrain)
        ypred = predict(xtest)
        correct, total = correct_count(ypred, ytest, correct, total, n)
      end
      (correct / total).round(5)
    end
  end
end
