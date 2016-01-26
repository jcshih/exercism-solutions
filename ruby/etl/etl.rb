module ETL
  module_function

  def transform(input)
    Hash[input.flat_map { |k, v| v.map { |l| [l.downcase, k] } }]
  end
end
