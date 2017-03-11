require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:params) { {partner_id: 1, title: 'Created Now', category_id: 1, expires_at: 3.days.from_now} }
  let(:job) { Job.create(params) }

  describe '#create' do
    it 'should be created in `draft` state' do
      expect(job.state).to eq('draft')
    end
  end

  describe '#activate' do
    it 'should change job state' do
      job.activate
      expect(job.state).to eq('active')
    end
  end

  describe '#activate!' do
    it 'should change job state and save job' do
      job.activate!
      expect(job.reload.state).to eq('active')
    end
  end
end
