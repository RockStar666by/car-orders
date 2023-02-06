using {epam.sap.dev.ordercar as rent} from '../../db/schema';

annotate rent.CarOrders {
    status       @Common.ValueList : {
        CollectionPath  : 'Statuses',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : status_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
        ],
        SearchSupported : true
    };

    CurrencyCode @Common.ValueList : {
        CollectionPath  : 'Currencies',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : CurrencyCode_code,
                ValueListProperty : 'code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'symbol'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'minor'
            }
        ],
        SearchSupported : true
    };
}
