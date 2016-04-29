require 'rubyml'

p = Perceptron.new(1000)
# l = LinearRegression.new
rml = RubyML.new
data2 = rml.load_data('/home/aravind/testdata/test2', true)
# data3 = rml.load_data('/home/aravind/testdata/test3', false)
x, y =  rml.separate_data(data2)
# l.fit(x, y)
# l.visualize(x, y)
p ('Accuracy: ' + (p.training_accuracy(x, y) * 100).to_s + '%')
