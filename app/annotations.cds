using { myAppSrv } from '../srv/service.cds';

annotate myAppSrv.Requests with @UI.DataPoint #requestName: {
  Value: requestName,
  Title: 'Request Name',
};
annotate myAppSrv.Requests with @UI.DataPoint #requestDate: {
  Value: requestDate,
  Title: 'Request Date',
};
annotate myAppSrv.Requests with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#requestName', ID: 'RequestName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#requestDate', ID: 'RequestDate' }
];
annotate myAppSrv.Requests with @UI.HeaderInfo: {
  TypeName: 'Request',
  TypeNamePlural: 'Requests',
  Title: { Value: requestId }
};
annotate myAppSrv.Requests with {
  ID @UI.Hidden
};
annotate myAppSrv.Requests with @UI.Identification: [{ Value: requestId }];
annotate myAppSrv.Requests with {
  requestId @Common.Label: 'Request Id';
  requestName @Common.Label: 'Request Name';
  requestDate @Common.Label: 'Request Date';
  Items @Common.Label: 'Items'
};
annotate myAppSrv.Requests with {
  ID @Common.Text: { $value: requestId, ![@UI.TextArrangement]: #TextOnly };
};
annotate myAppSrv.Requests with @UI.SelectionFields: [
  requestId
];
annotate myAppSrv.Requests with @UI.LineItem #Requests: [
    { $Type: 'UI.DataField', Value: requestId },
    { $Type: 'UI.DataField', Value: requestName },
    { $Type: 'UI.DataField', Value: requestDate }
];
annotate myAppSrv.Requests with @UI.SelectionPresentationVariant #Requests: {
  Text : 'Requests',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#Requests']
  }
};
annotate myAppSrv.Requests with @UI.FieldGroup #Requests: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: requestId },
    { $Type: 'UI.DataField', Value: requestName },
    { $Type: 'UI.DataField', Value: requestDate }

  ]
};


annotate myAppSrv.Items with @UI.LineItem #Items: [
    { $Type: 'UI.DataField', Value: itemId },
    { $Type: 'UI.DataField', Value: itemName }

  ];


annotate myAppSrv.Requests with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'Requests',
    Label: 'Requests',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'Requests', Label: 'Requests', Target: '@UI.FieldGroup#Requests' } ]
  },
  {
    $Type: 'UI.CollectionFacet',
    ID: 'Items',
    Label: 'Items',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'Items', Label: 'Items', Target: 'Items/@UI.LineItem#Items' } ]
  }
];
annotate myAppSrv.Items with {
  request @Common.ValueList: {
    CollectionPath: 'Requests',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: request_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'requestId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'requestName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'requestDate'
      },
    ],
  }
};
annotate myAppSrv.Items with @UI.DataPoint #itemName: {
  Value: itemName,
  Title: 'Item Name',
};
annotate myAppSrv.Items with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#itemName', ID: 'ItemName' }
];
annotate myAppSrv.Items with @UI.HeaderInfo: {
  TypeName: 'Item',
  TypeNamePlural: 'Items',
  Title: { Value: itemId }
};
annotate myAppSrv.Items with {
  ID @UI.Hidden
};
annotate myAppSrv.Items with @UI.Identification: [{ Value: itemId }];
annotate myAppSrv.Items with {
  itemId @Common.Label: 'Item Id';
  itemName @Common.Label: 'Item Name';
  request @Common.Label: 'Request'
};
annotate myAppSrv.Items with {
  ID @Common.Text: { $value: itemId, ![@UI.TextArrangement]: #TextOnly };
  request @Common.Text: { $value: request.requestId, ![@UI.TextArrangement]: #TextOnly };
};
annotate myAppSrv.Items with @UI.SelectionFields: [
  request_ID
];
annotate myAppSrv.Items with @UI.LineItem #Items: [
    { $Type: 'UI.DataField', Value: itemId },
    { $Type: 'UI.DataField', Value: itemName }
];
annotate myAppSrv.Items with @UI.SelectionPresentationVariant #Items: {
  Text : 'Items',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#Items']
  }
};
annotate myAppSrv.Items with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: itemId },
    { $Type: 'UI.DataField', Value: itemName },
    { $Type: 'UI.DataField', Label: 'Request', Value: request_ID }
]};
annotate myAppSrv.Items with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];