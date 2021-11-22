class UserBasicDetailsSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email
end
