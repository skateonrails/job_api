require 'rails_helper'

RSpec.describe JobImportService do
  let(:params) { {partner_id: 1, title: 'Created Now', category_id: 1, expires_at: 3.days.from_now} }
  let(:json_message) { params.to_json }

  describe '#import' do
    context 'with message representing a new job' do
      it 'should create a Job' do
        expect{ JobImportService.import(json_message) }.to change{ Job.count }.from(0).to(1)
      end
    end

    context 'with message representing an existing job' do
      it 'should not create job' do
        Job.create!(params)
        expect{ JobImportService.import(json_message) }.not_to change{ Job.count }
      end
    end
  end
end
