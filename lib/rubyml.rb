require 'rubyml/tools'
require 'rubyml/linear_regression'
require 'rubyml/perceptron'

class Matrix
  alias old_element element
  def [](i, j)
    if i.class == Fixnum && j == ':'
      row(i)
    elsif j.class == Fixnum && i == ':'
      column(j)
    else
      redirect(i, j)
    end
  end

  def redirect(i, j)
    if i.class == String && j.class == String
      redirect2(i, j)
    else
      old_element(i, j)
    end
  end

  def redirect2(i, j)
    if i.include?(':') && j.include?(':')
      redirect3(i, j)
    else
      old_element(i, j)
    end
  end

  def redirect3(i, j)
    rs, re = i.split(':').map { |e| e == '' ? 0 : Integer(e) }
    cs, ce = j.split(':').map { |e| e == '' ? 0 : Integer(e) }
    return if rs >= re || cs >= ce
  end
end

class RubyML
  include Tools::DataMethods
end
