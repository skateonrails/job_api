require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.create! }

  before :each do
    Job.create( {partner_id: 1, title: 'Created Now', category_id: category.id, expires_at: 3.days.from_now} )
    Job.create( {partner_id: 2, title: 'Created Now 2', category_id: category.id, expires_at: 4.days.from_now} )
    Job.create( {partner_id: 3, title: 'Active Job', category_id: category.id, expires_at: 5.days.from_now, state: 'active'} )
    Job.create( {partner_id: 4, title: 'Created Now 4', category_id: category.id, expires_at: 6.days.from_now} )
  end

  describe '#active_jobs_count' do
    it 'should return the count of active jobs' do
      expect(category.active_jobs_count).to eq(1)
    end
  end

  describe '#active_jobs_percentage' do
    context 'with jobs associated to category' do
      it 'should return the percentage of active jobs' do
        expect(category.active_jobs_percentage).to eq(25)
      end
    end

    context 'without jobs associated to category' do
      it 'should return 0' do
        Job.destroy_all
        expect(category.active_jobs_percentage).to be_zero
      end
    end
  end
end
