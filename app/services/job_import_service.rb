module JobImportService
  class << self
    # :reek:FeatureEnvy
    def import(json_message)
      params = JSON.parse(json_message)
      ActiveRecord::Base.transaction do
        find_or_create_category(params['category_id'])
        Job.create!(params) unless Job.where(partner_id: params['partner_id']).exists?
      end
    end

    private

    def find_or_create_category(category_id)
      Category.where(id: category_id).first || Category.create!(id: category_id)
    end
  end
end
