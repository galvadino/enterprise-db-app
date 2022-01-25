import { TargetConfigEntity } from './../../models/targetconfig';
import { TargetConfigService } from './../../services/target-config.service';
import {
  Component,
  ElementRef,
  Inject,
  OnInit,
  ViewChild,
} from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-target-config',
  templateUrl: './target-config.component.html',
  styleUrls: ['./target-config.component.scss'],
})
export class TargetConfigComponent implements OnInit {
  constructor(
    private targetconfig: TargetConfigService,
    private fb: FormBuilder
  ) {}
  @ViewChild('editModal') editModal: any;

  targetconfigs: TargetConfigEntity[] = [];

  addTargetConfig = this.fb.group({
    checkEmployeeId: 0,
    checkEndDate: 0,
    checkFirstName: 0,
    checkLastName: 0,
    checkLoginName: 0,
    checkSVNR: 0,
    checkStartDate: 0,
    check_password: 0,
    targetconfigid: 8,
  });
  editTargetConfig = this.fb.group({
    checkEmployeeId: 0,
    checkEndDate: 0,
    checkFirstName: 0,
    checkLastName: 0,
    checkLoginName: 0,
    checkSVNR: 0,
    checkStartDate: 0,
    check_password: 0,
    targetconfig_id: 8,
  });

  ngOnInit(): void {
    this.targetconfig.getAllTargetConfigs().subscribe((data) => {
      this.targetconfigs = data;
    });
  }
  onSubmit(): void {
    this.targetconfig
      .postTargetConfig(this.addTargetConfig.value)
      .subscribe((data) => {
        this.targetconfigs.push(data);
        console.log(this.addTargetConfig.value);
      });
  }
  deleteTargetConfig(id: number | undefined): void {
    if (confirm('Are you sure to delete Config ID ' + id)) {
      this.targetconfig.deleteTargetConfig(id).subscribe(() => {
        this.targetconfigs = this.targetconfigs.filter(
          (t) => t.targetconfig_id !== id
        );
      });
    }
  }
  getTargetConfig(id: number | undefined): void {
    this.targetconfig.getTargetConfig(id).subscribe((data) => {
      this.editTargetConfig.setValue(data);
      console.log(this.editTargetConfig.value);
    });
  }
  editTargetConfigs(): void {
    this.targetconfig
      .patchTargetConfig(
        this.editTargetConfig.value.targetconfig_id,
        this.editTargetConfig.value
      )
      .subscribe((data) => {
        this.editModal.nativeElement.click();
        this.ngOnInit();
      });
  }
}
