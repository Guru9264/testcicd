using { myApp } from '../db/schema.cds';

service myAppSrv {
  @odata.draft.enabled
  entity Requests as projection on myApp.Requests;
  @odata.draft.enabled
  entity Items as projection on myApp.Items;
}