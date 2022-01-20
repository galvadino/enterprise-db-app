import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { TargetStateEntity } from '../models/targetstate';

@Injectable({
  providedIn: 'root',
})
export class TargetStateService {
  constructor(private http: HttpClient) {}

  getAllTargetStates(): Observable<TargetStateEntity[]> {
    return this.http.get<TargetStateEntity[]>(
      environment.API_URL + '/Targetstate'
    );
  }

  getActiveTargetStates(active: number): Observable<TargetStateEntity[]> {
    // getActiveTargetStates
    return this.http.get<TargetStateEntity[]>(
      environment.API_URL + `/Targetstate/active/${active}`
    );
  }
  getTargetStatebyConfigId(id: string): Observable<TargetStateEntity> {
    // getTargetStatebyConfigId
    return this.http.get<TargetStateEntity>(
      environment.API_URL + `/Targetstate/targetconfigid/${id}`
    );
  }
  getTargetState(id: number | undefined): Observable<TargetStateEntity> {
    // getTargetState
    return this.http.get<TargetStateEntity>(
      environment.API_URL + `/Targetstate/id/${id}`
    );
  }

  getTargetStatebyDepartmentId(id: string): Observable<TargetStateEntity> {
    return this.http.get<TargetStateEntity>(
      environment.API_URL + `/Targetstate/department_id/${id}`
    );
  }
  postTargetState(targetstate: TargetStateEntity) {
    return this.http.post(environment.API_URL + '/Targetstate', targetstate);
  }
  patchTargetState(id: number | undefined, targetstate: TargetStateEntity) {
    return this.http.patch(
      environment.API_URL + `/Targetstate/${id}`,
      targetstate
    );
  }
  deleteTargetState(id: number | undefined) {
    return this.http.delete(environment.API_URL + `/Targetstate/${id}`);
  }
  deleteInactiveTargetStates(active: number) {
    return this.http.delete(
      environment.API_URL + `/Targetstate/inactive/${active}`
    );
  }
}
