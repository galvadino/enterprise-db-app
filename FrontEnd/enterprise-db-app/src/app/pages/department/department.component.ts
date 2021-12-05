import { DepartmentEntity } from './../../models/department';
import { DepartmentService } from './../../services/department.service';
import { HttpClient } from '@angular/common/http';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  templateUrl: './department.component.html',
  styleUrls: ['./department.component.scss'],
})
export class DepartmentComponent implements OnInit {
  allDepartments: any[] = [];
  @ViewChild('editmodal') editmodal: any = null;
  @ViewChild('addmodal') addmodal: any = null;

  checkoutForm = this.fb.group({
    departmentId: 0,
    name: '',
  });
  edit = this.fb.group({
    departmentId: 0,
    name: '',
  });

  constructor(
    private http: HttpClient,
    private department: DepartmentService,
    private fb: FormBuilder
  ) {}

  ngOnInit(): void {
    this.department.getDepartments().subscribe((data: any) => {
      this.allDepartments = data;
    });
  }

  onSubmit(): void {
    // Process checkout data here
    //this.checkoutForm.value
    this.department
      .postDepartment(this.checkoutForm.value)
      .subscribe((data: any) => {
        this.allDepartments.push(data);
        this.checkoutForm.reset();
        this.addmodal.nativeElement.click(); //<-- here

      });

    console.warn('Your order has been submitted', this.checkoutForm.value);
    this.checkoutForm.reset();
  }

  deleteDepartment(id: any) {
    if (confirm('Are you sure to delete department with id = ' + id)) {
      this.department.deleteDepartment(id).subscribe(() => {
        this.allDepartments = this.allDepartments.filter(
          (department) => department.departmentId !== id
        );
        window.alert('Department deleted');
      },
      error => {
        window.alert("id is not unique")
      });
    }
  }
  editDepartment(id: any) {
    this.department.getDepartment(id).subscribe((data: any) => {
      console.log(this.edit.value);
      console.log(data);
      this.edit.setValue({
        departmentId: data[0].departmentId,
        name: data[0].name,
      }); // setValue() method sets the value of the form group.
    });
  }

  updateDepartment() {
    this.department
      .patchDepartment(this.edit.value.departmentId, this.edit.value)
      .subscribe(() => {
        this.allDepartments = this.allDepartments.map((department) => {
          if (department.departmentId === this.edit.value.departmentId) {
            return this.edit.value;
          }
          return department;
        });
      });
    this.editmodal.nativeElement.click(); //<-- here
  }
}
