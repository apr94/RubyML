require 'matrix'

module Tools
  module DataMethods
    def load_data(file)
      mat = Array.new
      File.foreach(file) do |f|
        mat << f.split(',').map {|i| Float(i) }
      end
      Matrix.rows(mat)
    end

    def store_data(data)
    end

    def bias_trick(mat)
    end

    def normalize(data)
    end

    def plot(data)
    end
  end
end
