# Job API
This project is one service used in a more complex project, named [Job Import](https://github.com/skateonrails/job_import).  
See the entire explanation of this project on Job Import page.

## Constraints
Those are the constraints that made me build this application the way it is:

1. This application should expose a REST API to:
  - Create, list and activate a job;
  - List the percentage and the number of active jobs by category;
2. This application should receive parsed jobs from another applicatio ([Job Queue](https://github.com/skateonrails/job_queue)) using some messaging service - I have chosen [RabbitMQ](http://www.rabbitmq.com) as my message server;
3. Consider `job.partner_id` attribute as a key to make the import of jobs idempotent;
4. Every imported job must be on 'draft' state - the sneakers worker is responsible for this;
