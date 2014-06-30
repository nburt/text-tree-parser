class TreeParser

  def initialize(data)
    @data = data
  end

  def parse
    employees = @data.split("\n")
    employee_management_hierarchy = {}
    employees.each_with_index do |employee, index|
      if get_whitespace(employee) == 4
        employee_management_hierarchy[employee.strip] = nil
      else
        if get_whitespace(employee) > get_whitespace(employees[index - 1])
          employee_management_hierarchy[employee.strip] = employees[index - 1].strip
        else
          counter = 1
          while get_whitespace(employee) == get_whitespace(employees[index - counter]) || get_whitespace(employee) < get_whitespace(employees[index - counter])
            counter += 1
          end
          employee_management_hierarchy[employee.strip] = employees[index - counter].strip
        end
      end
    end
    employee_management_hierarchy
  end

  private

  def get_whitespace(employee)
    employee.length - employee.strip.length
  end

end
