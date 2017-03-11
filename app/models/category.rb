class Category < ApplicationRecord
  has_many :jobs

  def active_jobs_count
    @active_jobs_count ||= self.jobs.active.count
  end

  def active_jobs_percentage
    return 0 if total_jobs_count.zero?
    (active_jobs_count * 100) / total_jobs_count.to_f
  end

  private

  def total_jobs_count
    @total_jobs_count ||= self.jobs.count
  end
end
