import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';
import { DepartmentEntity } from '../models/department';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class DepartmentService {
  constructor(private http: HttpClient) {}

  getDepartments(): Observable<DepartmentEntity[]> {
    return this.http.get<DepartmentEntity[]>(
      environment.API_URL + '/departments'
    );
  }
  getDepartment(id: string): Observable<DepartmentEntity> {
    return this.http.get<DepartmentEntity>(
      environment.API_URL + `/departments/${id}`
    );
  }
  deleteDepartment(id: string) {
    return this.http.delete(environment.API_URL + `/departments/delete/${id}`);
  }
  patchDepartment(id: string, department: DepartmentEntity) {
    return this.http.patch(
      environment.API_URL + `/departments/${id}`,
      {name:department.name}
    );
  }
  postDepartment(department: DepartmentEntity) {
    return this.http.post(environment.API_URL + '/departments', department);
  }
}
