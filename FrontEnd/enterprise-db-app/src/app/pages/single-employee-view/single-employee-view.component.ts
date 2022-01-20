import { EmployeeService } from './../../services/employee.service';
import { EmployeeEntity } from './../../models/employee';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DepartmentService } from 'src/app/services/department.service';

@Component({
  templateUrl: './single-employee-view.component.html',
  styleUrls: ['./single-employee-view.component.scss'],
})
export class SingleEmployeeViewComponent implements OnInit {
  id: string = '';
  departmentname: any;
  employeeObj: any;
  constructor(
    private route: ActivatedRoute,
    private employee: EmployeeService,
    private department: DepartmentService
  ) {}

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    console.log(this.id);
    this.getStaffByID(this.id);
  }
  getStaffByID(id: any) {
    this.employee.getEmployee(id).subscribe((res) => {
      this.employeeObj = res;
      this.getDepartmentName(res.departmentId);
      console.log(res);
    });
  }
  getDepartmentName(id: any) {
    this.department.getDepartment(id).subscribe((res) => {
      this.departmentname = res.name;
      console.log(this.departmentname);
    });
  }
}
