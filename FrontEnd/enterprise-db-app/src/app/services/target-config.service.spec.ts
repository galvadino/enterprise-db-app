import { TestBed } from '@angular/core/testing';

import { TargetConfigService } from './target-config.service';

describe('TargetConfigService', () => {
  let service: TargetConfigService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TargetConfigService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
