class UserDetailsSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :password
end
