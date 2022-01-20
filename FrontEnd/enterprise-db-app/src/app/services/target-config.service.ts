import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { TargetConfigEntity } from './../models/targetconfig';

@Injectable({
  providedIn: 'root',
})
export class TargetConfigService {
  constructor(private http: HttpClient) {}

  getAllTargetConfigs(): Observable<TargetConfigEntity[]> {
    return this.http.get<TargetConfigEntity[]>(
      environment.API_URL + '/targetconfig'
    );
  }
  getTargetConfig(id: number | undefined): Observable<TargetConfigEntity> {
    return this.http.get<TargetConfigEntity>(
      environment.API_URL + `/targetconfig/id/${id}`
    );
  }
  deleteTargetConfig(id: number | undefined) {
    return this.http.delete(environment.API_URL + `/targetconfig/delete/${id}`);
  }
  postTargetConfig(targetconfig: TargetConfigEntity) {
    return this.http.post(environment.API_URL + '/targetconfig', targetconfig);
  }
  patchTargetConfig(id: number, targetconfig: TargetConfigEntity) {
    return this.http.patch(
      environment.API_URL + `/targetconfig/${id}`,
      targetconfig
    );
  }
}
