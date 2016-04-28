class LinearRegression    
  attr_reader :theta 
  
  def fit(test_data)
    col_vec = test_data.column_vectors
    yMat = Matrix.columns([col_vec.pop])
    ones = Matrix.columns([[1] * test_data.row_count])
    xMat = ones.hstack(Matrix.columns(col_vec))
    @theta = ((xMat.t * xMat).inv * xMat.t) * yMat
  end
  
  def predict()
  end
end
