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
    if i.include?(':') || j.include?(':')
      redirect3(i, j)
    else
      old_element(i, j)
    end
  end

  def redirect3(i, j)
    rs, re = i.split(':').map { |e| e == '' ? 0 : Integer(e) }
    cs, ce = j.split(':').map { |e| e == '' ? 0 : Integer(e) }
    redirect4(rs, re, cs, ce, [i, j])
  end

  def redirect4(rs, re, cs, ce, orig)
    re = rs + 1 unless orig[0].include?(':')
    ce = cs + 1 unless orig[1].include?(':')
    redirect5(rs, re, cs, ce)
  end

  def redirect5(rs, re, cs, ce)
    rs = rs.nil? ? 0 : rs
    cs = cs.nil? ? 0 : cs
    re = re.nil? ? row_count : re
    ce = ce.nil? ? column_count : ce
    redirect6(rs, re, cs, ce)
  end

  def redirect6(rs, re, cs, ce)
    return if rs >= re || cs >= ce
    rv = row_vectors[rs..re - 1].map(&:to_a)
    nrv = rv.map { |e| e[cs..ce - 1] }
    Matrix.rows(nrv)
  end
end

class RubyML
  include Tools::DataMethods
end
