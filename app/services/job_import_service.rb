module JobImportService
  def self.import(json_message)
    params = JSON.parse(json_message)
    Job.create!(params) unless Job.where(partner_id: params['partner_id']).exists?
  end
end
