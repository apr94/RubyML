require 'rubyml'

p = Perceptron.new(1000)
l = LinearRegression.new()
rml = RubyML.new()
data = rml.load_data("/home/aravind/test2", true)
x, y =  rml.separate_data(data)
p ("Accuracy: " + (p.training_accuracy(x, y)*100).to_s + "%")
