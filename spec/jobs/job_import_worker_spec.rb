require 'rails_helper'

RSpec.describe JobImportWorker do
  let(:params) { {partner_id: 1, title: 'Created Now', category_id: 1, expires_at: 3.days.from_now} }
  let(:json_message) { params.to_json }

  before :each do
    allow_any_instance_of(JobImportWorker).to receive(:ack!).and_return(true)
  end

  describe '#work' do
    it 'should execute code from JobImportService' do
      expect(JobImportService).to receive(:import).with(json_message).and_return(true)
      JobImportWorker.new.work(json_message)
    end
  end
end
