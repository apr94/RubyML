Gem::Specification.new do |s|
  s.name = 'rubyml'
  s.version = '0.0.1'
  s.add_runtime_dependency 'gruff', ['= 0.6.0']
  s.add_development_dependency 'coveralls', ['= 0.8.13']
  s.date = '2016-04-29'
  s.summary = 'A simple Ruby machine learning library.'
  s.description = 'This is a simple machine learning library
    written in Ruby. It provides implementations of linear regression
    and multiclass perceptron and visualization and validation methods
    to verify results. Also included are helper methods to work with
    training and testing data.'
  s.authors = ['Palimar Rao']
  s.files = ['lib/rubyml.rb',
             'lib/rubyml/tools.rb',
             'lib/rubyml/linear_regression.rb',
             'lib/rubyml/perceptron.rb']
  s.license = 'MIT'
end
