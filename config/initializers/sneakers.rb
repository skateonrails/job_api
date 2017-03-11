require 'sneakers'
amqp_address = ENV['AMQP_ADDRESS'] || 'amqp://guest:guest@localhost:5672'

config = {
  timeout_job_after: 10,
  prefetch: 5,
  threads: 5,
  durable: true,
  ack: true,
  heartbeat: 2,
  exchange: 'sneakers',
  start_worker_delay: 10,
  log: STDOUT,
  amqp: amqp_address,
  workers: 2
}

Sneakers.configure config
Sneakers.logger.level = Logger::INFO
