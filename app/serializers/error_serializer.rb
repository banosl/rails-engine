class ErrorSerializer
  def self.not_found(error)
    response = {errors: [{title: error.message, status: "404"}]}

  end

  def self.no_match
    response = {data: {}}
  end

  def self.bad_request
    response = {errors: {title: "bad request"}}
  end
end
