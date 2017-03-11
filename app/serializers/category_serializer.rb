class CategorySerializer < ActiveModel::Serializer
  attributes :id, :active_jobs_count, :active_jobs_percentage
end
