class JobSerializer < ActiveModel::Serializer
  attributes :id, :partner_id, :title, :category_id, :expires_at, :state
end
