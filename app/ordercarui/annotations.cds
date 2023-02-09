using OrderCarService as service from '../../srv/service';

annotate service.CarOrders with @(
    UI        : {
        SelectionFields     : [status_ID],
        Identification      : [
            {Value : orderUUID},
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'OrderCarService.sendCar',
                Label  : '{i18n>sendCar}'
            },
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'OrderCarService.approveCar',
                Label  : '{i18n>approveCar}'
            },
        ],

        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : carOrderID,
                ![@UI.Importance] : #High,
                Label             : '{i18n>carOrderID}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : status_ID,
                Criticality       : status.criticality,
                ![@UI.Importance] : #High,
                Label             : '{i18n>status}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : make,
                ![@UI.Importance] : #High,
                Label             : '{i18n>make}'
            },
                        {
                $Type             : 'UI.DataField',
                Value             : model,
                ![@UI.Importance] : #High,
                Label             : '{i18n>model}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : officeCity,
                ![@UI.Importance] : #High,
                Label             : '{i18n>officeCity}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : officeStreet,
                ![@UI.Importance] : #High,
                Label             : '{i18n>officeStreet}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : rent,
                ![@UI.Importance] : #High,
                Label             : '{i18n>rent}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : quantity,
                ![@UI.Importance] : #High,
                Label             : '{i18n>quantity}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : totalPrice,
                ![@UI.Importance] : #High,
                Label             : '{i18n>totalprice}'
            },

        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : carOrderID,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Order',
            TypeNamePlural : 'Orders',
            Title          : {Value : make},
            Description    : {
                Value       : status_ID,
                Criticality : status.criticality
            }
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : '{i18n>quantity}'
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                Label : '{i18n>totalprice}'
            }
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : carOrderID,
                Label : '{i18n> carOrderID}'
            },
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality,
                Label       : '{i18n>status}'
            },
            {
                $Type : 'UI.DataField',
                Value : make,
                Label : '{i18n>make}'
            },
            {
                $Type : 'UI.DataField',
                Value : officeCity,
                Label : '{i18n>officeCity}'
            },
            {
                $Type : 'UI.DataField',
                Value : officeStreet,
                Label : '{i18n>officeStreet}'
            },
            {
                $Type : 'UI.DataField',
                Value : rent,
                Label : '{i18n>rent}'
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : '{i18n>quantity}'
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                Label : '{i18n>totalprice}'
            },
            {
                $Type : 'UI.DataField',
                Value : totalLocal,
                Label : '{i18n>localtotalprice}'
            },
        ]},
        FieldGroup #AdministrativeData : {Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            }
        ]}
    },
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'PODetails',
            Label  : '{i18n>orderInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>orderinfo}',
                Target : '@UI.FieldGroup#Details'
            }]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>admininfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);
