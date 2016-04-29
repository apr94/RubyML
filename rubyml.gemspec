Gem::Specification.new do |s|
  s.name = 'rubyml'
  s.version = '0.0.1'
  s.add_runtime_dependency 'nmatrix', ['= 0.2.1']
  s.date = '2016-04-29'
  s.summary = 'A simple Ruby machine learning library.'
  s.description = 'This is a simple machine learning library
    written in Ruby. It provides implementations of linear regression,
    multiclass perceptron, and K-means image segmentation.
    Also included are helper methods to work with training and testing data.'
  s.authors = ['Palimar Rao']
  s.files = ['lib/rubyml.rb',
             'lib/rubyml/tools.rb',
             'lib/rubyml/linear_regression.rb',
             'lib/rubyml/perceptron.rb']
  s.license = 'MIT'
end
