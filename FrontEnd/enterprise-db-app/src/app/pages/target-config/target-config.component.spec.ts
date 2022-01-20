import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TargetConfigComponent } from './target-config.component';

describe('TargetConfigComponent', () => {
  let component: TargetConfigComponent;
  let fixture: ComponentFixture<TargetConfigComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TargetConfigComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TargetConfigComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
