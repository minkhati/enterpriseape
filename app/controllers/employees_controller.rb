class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
 
  def index
    @employees = Employee.all
  end

  def show
    #respond_with(@employee)
  end

  def new
    @employee = Employee.new
    #respond_with(@employee)    
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save 
        format.html { redirect_to @employee, notice: 'Employee was sucessfully created.' }
        format.json { render action: 'show', status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
    #    respond_with(@employee)
  end

  # PATCH/PUT /employee/1
  # PATCH/PUT /employee/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  #DELETE /employee/1
  #DELETE /employee/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :phone, :job_type)
    end
end
