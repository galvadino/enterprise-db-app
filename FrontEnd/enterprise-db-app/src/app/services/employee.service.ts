import { EmployeeEntity } from './../models/employee';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class EmployeeService {
  constructor(private http: HttpClient) {}

  getEmployees(): Observable<EmployeeEntity[]> {
    return this.http.get<EmployeeEntity[]>(environment.API_URL + '/employee');
  }
  getEmployee(id: string): Observable<EmployeeEntity> {
    return this.http.get<EmployeeEntity>(
      environment.API_URL + `/employee/id/${id}`
    );
  }
  deleteEmployee(id: string) {
    return this.http.delete(environment.API_URL + `/employee/${id}`);
  }
  patchEmployee(id: number, employee: EmployeeEntity) {
    return this.http.patch(environment.API_URL + `/employee/${id}`, employee);
  }
  getActiveEmployee(active: string) {
    return this.http.get(environment.API_URL + `/employee/active/${active}`);
  }
  addEmployee(employee: EmployeeEntity) {
    return this.http.post(environment.API_URL + '/employee', employee);
  }
}
