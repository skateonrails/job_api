class JobsController < AuthenticatedController
  # GET /jobs
  def index
    render json: jobs
  end

  # GET /jobs/1
  def show
    render json: job
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)
    find_or_create_category

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # POST /jobs/1/activate
  def activate
    job.activate!

    render json: job
  end

  private

  def job
    @job ||= Job.find(params[:id])
  end

  def jobs
    @jobs ||= Job.all
  end

  def job_params
    params.require(:job).permit(:partner_id, :category_id, :title, :expires_at, :state)
  end

  def find_or_create_category
    Category.find_or_create_by!(id: job_params[:category_id])
  end
end
