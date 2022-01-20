import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TargetStateComponent } from './target-state.component';

describe('TargetStateComponent', () => {
  let component: TargetStateComponent;
  let fixture: ComponentFixture<TargetStateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TargetStateComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TargetStateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
