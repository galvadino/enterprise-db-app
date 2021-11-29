export interface EmployeeEntity {
  active?: number;
  department?: number;
  employeeid: number;
  end_date?: Date | null;
  firstName?: string;
  lastName?: string;
  login_name?: string;
  password?: string;
  start_date?: Date;
  svnr?: number;
}
