import { TargetStateEntity } from './../../models/targetstate';
import { TargetStateService } from './../../services/target-state.service';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-target-state',
  templateUrl: './target-state.component.html',
  styleUrls: ['./target-state.component.scss'],
})
export class TargetStateComponent implements OnInit {
  targetstates: TargetStateEntity[] = [];
  targetstatesObj: TargetStateEntity = {
    targetstateid: 0,
    active: 0,
    targetconfigid: 0,
    departmentid: 0,
    hostname: '',
    password: '',
    path: '',
    port: 0,
    tablename: '',
    type: '',
    user: '',
    lastupdated: new Date(),
    activesince: new Date(),
    last_synced: new Date(),
  };

  addstate = this.fb.group({
    targetstateid: 0,
    active: 0,
    targetconfigid: 0,
    departmentid: 0,
    hostname: '',
    password: '',
    path: '',
    port: 0,
    tablename: '',
    type: '',
    user: '',
    lastupdated: new Date(),
    activesince: new Date(),
    last_synced: new Date(),
  });

  constructor(
    private targetstate: TargetStateService,
    private fb: FormBuilder
  ) {}

  ngOnInit(): void {
    this.targetstate.getAllTargetStates().subscribe((data) => {
      this.targetstates = data;
      console.log(this.targetstates);
    });
  }
  onSubmit(): void {
    this.targetstate.postTargetState(this.addstate.value).subscribe((data) => {
      this.targetstates.push(data);
      console.log(this.addstate.value);
    });
  }
  editStaffrequest(): void {
    //delete this.targetstatesObj.targetstateid;
console.log(this.targetstatesObj)
    this.targetstate
      .patchTargetState(
        this.targetstatesObj.targetstateid,
        this.targetstatesObj
      )
      .subscribe((data) => {
        console.log(this.targetstatesObj);
        location.reload();
      });
  }
  editState(id: number | undefined): void {
    this.targetstate.getTargetState(id).subscribe((data) => {
      this.targetstatesObj = data;
    });
  }
  deletestate(id: number | undefined): void {
    if (confirm('Are you sure to delete ' + id)) {
      this.targetstate.deleteTargetState(id).subscribe((data) => {
        this.targetstates = this.targetstates.filter(
          (e) => e.targetstateid !== id
        );
      });
    }
  }
}
