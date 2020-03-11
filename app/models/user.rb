class User < ActiveRecord::Base
  def to_formatted_string
    "#{id}.  #{name} - #{email}"
  end
end