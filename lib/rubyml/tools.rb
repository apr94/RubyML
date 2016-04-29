require 'matrix'

module Tools
  module DataMethods
    def load_data(file, text = false)
      mat = []
      File.foreach(file) do |f|
        mat << f.split(',').map { |i| text ? String(i).chomp : Float(i) }
      end
      Matrix.rows(mat)
    end

    def separate_data(data)
      col_vec = data.column_vectors
      y = Matrix.columns([col_vec.pop])
      x = Matrix.columns(col_vec).collect { |e| Float(e) }
      [x, y]
    end

    def mat_to_array(data)
      arr = []
      data.each { |e| arr << e }
      arr
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
