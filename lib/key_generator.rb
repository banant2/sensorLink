module KeyGenerator

  # generates a database unique api key
  def generate_api_key(size = 16)
    alphanumerics = ('0'..'9').to_a + ('A'..'Z').to_a
    new_key = (1..size).map {alphanumerics[Kernel.rand(36)]}.join

    # if key exists in database, regenerate key
    new_key = generate_api_key

    loop do
      alphanumerics = ('0'..'9').to_a + ('A'..'Z').to_a
      new_key = (1..size).map {alphanumerics[Kernel.rand(36)]}.join

      # if key exists in database, regenerate key
      new_key = generate_api_key
      break if not(ApiKey.find_by_api_key(new_key))

    return new_key
  end
end
