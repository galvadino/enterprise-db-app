import { TestBed } from '@angular/core/testing';

import { TargetStateService } from './target-state.service';

describe('TargetStateService', () => {
  let service: TargetStateService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TargetStateService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
