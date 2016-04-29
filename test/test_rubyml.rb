require 'minitest/autorun'
require 'rubyml'
require 'coveralls'
Coveralls.wear!

class RubyMLTest < Minitest::Test
  def test_matrix_splicing_one
    mat1 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    mat2 = Matrix.rows([[1, 2, 3],
                        [5, 6, 7],
                        [9, 10, 11],
                        [12, 13, 14]])
    assert_equal mat2, mat1[':', ':3']
  end

  def test_matrix_splicing_two
    mat1 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    mat2 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    assert_equal mat2, mat1[':', ':']
  end

  def test_matrix_splicing_three
    mat1 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    mat2 = Matrix.rows([[2, 3, 4],
                        [6, 7, 8],
                        [10, 11, 12]])
    assert_equal mat2, mat1[':3', '1:']
  end

  def test_matrix_splicing_four
    mat1 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    mat2 = Matrix.rows([])
    assert_equal mat2, mat1['1:1', '2:2']
  end

  def test_matrix_splicing_five
    mat1 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    mat2 = Matrix.rows([[7]])
    assert_equal mat2, mat1['1:2', '2:3']
  end

  def test_matrix_splicing_six
    mat1 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    mat2 = Matrix.rows([[2], [6], [10], [13]])
    assert_equal mat2, mat1[':', '1']
  end

  def test_matrix_splicing_seven
    mat1 = Matrix.rows([[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 11, 12],
                        [12, 13, 14, 15]])
    mat2 = Matrix.rows([[1, 2, 3, 4]])
    assert_equal mat2, mat1['0', ':']
  end
end
