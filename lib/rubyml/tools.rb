require 'matrix'

module Tools
  module DataMethods
    def load_data(file)
      mat = []
      File.foreach(file) do |f|
        mat << f.split(',').map { |i| Float(i) }
      end
      Matrix.rows(mat)
    end

    def store_data(data)
    end

    def separate_data(data)
      col_vec = data.column_vectors
      y = Matrix.columns([col_vec.pop])
      x = Matrix.columns(col_vec)
      [x, y]
    end

    def mat_to_array(data)
      arr = []
      data.each { |e| arr << e }
    end

    def bias_trick(x)
      ones = Matrix.columns([[1] * x.row_count])
      x_bias = ones.hstack(x)
      x_bias
    end

    def normalize(data)
    end

    def plot(data)
    end
  end
end
