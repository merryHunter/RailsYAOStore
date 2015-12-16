class Request < ActiveRecord::Base
  attr_accessible :business, :payment_details, :private, :request_date, :user_id, :accepted
end
