import { EmployeeService } from './../../services/employee.service';
import { EmployeeEntity } from './../../models/employee';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder } from '@angular/forms';

@Component({
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent implements OnInit {
  allEmployees: EmployeeEntity[] = [];

  editEmployeeObj: EmployeeEntity = {
    active: 0,
    departmentId: 0,
    employeeid: 0,
    end_date: new Date(),
    firstName: '',
    lastName: '',
    login_name: '',
    password: '',
    start_date: new Date(),
    svnr: 0,
  };
  addEmployeeObj: EmployeeEntity = {
    active: 0,
    departmentId: 0,
    employeeid: 0,
    end_date: null,
    firstName: '',
    lastName: '',
    login_name: '',
    password: '',
    start_date: new Date(),
    svnr: 1234567891,
  };

  constructor(
    private employee: EmployeeService,
    private router: Router,
    private fb: FormBuilder
  ) {}

  ngOnInit(): void {
    this.employee.getEmployees().subscribe((data) => {
      this.allEmployees = data;
      console.log(this.allEmployees);
    });
  }
  viewEmployee(id: any): any {
    this.router.navigate(['viewemployee', id]);
  }
  deleteStaff(id: any): any {
    if (confirm('Are you sure to delete ' + id)) {
      this.employee.deleteEmployee(id).subscribe((res) => {
        console.log(res);
        this.ngOnInit();
      });
    }
  }
  editEmployee(id: any): any {
    this.employee.getEmployee(id).subscribe((res) => {
      this.editEmployeeObj = res;
      console.log(res);
    });
  }
  editStaffrequest(): any {
   // delete this.editEmployeeObj.svnr;
    this.employee
      .patchEmployee(this.editEmployeeObj.employeeid, this.editEmployeeObj)
      .subscribe((res) => {
        console.log(this.editEmployeeObj);
        this.ngOnInit();
      });
    console.log(this.editEmployeeObj);
    location.reload();
  }

  addEmployee() {
    console.log(this.addEmployeeObj);
    this.employee.addEmployee(this.addEmployeeObj).subscribe((res) => {
      console.log(this.addEmployeeObj);
      console.log(res);
      this.addEmployeeObj = {
        active: 0,
        departmentId: 0,
        employeeid: 0,
        end_date: new Date(),
        firstName: '',
        lastName: '',
        login_name: '',
        password: '',
        start_date: new Date(),
        svnr: 12345678191,
      };
    });
    //location.reload();
  }
}
