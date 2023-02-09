class ErrorSerializer
  def self.not_found(error)
    response = {errors: [{title: error.message, status: "404"}]}

  end
end
