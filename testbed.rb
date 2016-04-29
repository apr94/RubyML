require 'rubyml'

p = Perceptron.new(1000)
rml = RubyML.new()
data = rml.load_data("/home/aravind/test2", true)
x, y =  rml.separate_data(data)
p.fit(x, y)
pred = p.predict(x)
count = 0.0
pred.row_count.times do |r|
  count += (pred[r,0] == y[r,0] ? 1 : 0)
end
p String(count/Float(pred.row_count))
p p.training_accuracy(x, y)
