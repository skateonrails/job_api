class JobImportWorker
  include Sneakers::Worker
  QUEUE_NAME = :job_import

  from_queue ENV['QUEUE_NAME'] || QUEUE_NAME

  def work(json_message)
    JobImportService.import(json_message)
    ack!
  end
end
