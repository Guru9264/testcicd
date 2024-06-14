namespace myApp;

entity Requests {
  key ID: UUID;
  requestId: String(50) @assert.unique @mandatory;
  requestName: String(50);
  requestDate: Date;
  Items: Association to many Items on Items.request = $self;
}

entity Items {
  key ID: UUID;
  itemId: String(50) @assert.unique @mandatory;
  itemName: String(50);
  request: Association to Requests;
}
