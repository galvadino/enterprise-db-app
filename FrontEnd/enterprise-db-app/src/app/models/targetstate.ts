export interface TargetStateEntity {
  targetstateid?: number;
  active?: number;
  targetconfigid?: number;
  lastupdated?: Date;
  activesince?: Date;
  departmentid?: number;
  hostname?: string;
  password?: string;
  path?: string;
  port?: number;
  tablename?: string;
  type?: string;
  user?: string;
  last_synced?: Date;
}
