using {epam.sap.dev.ordercar as order} from '../../db/schema';

annotate order.CarOrders with @title : '{i18n>carTitle}' {
    orderUUID       @UI.Hidden;
    make            @title                  : '{i18n>make}';
    model           @title                  : '{i18n>model}';
    officeCity      @title                  : '{i18n>firstname}';
    officeStreet    @title                  : '{i18n>lastname}';
    quantity        @title                  : '{i18n>quantity}';
    rent            @title                  : '{i18n>rent}'
                    @Measures.ISOCurrency   : CurrencyCode_code;
    status          @title                  : '{i18n>status}'
                    @Common.Text            : status.name
                    @Common.TextArrangement : #TextFirst;
    totalPrice      @title                  : '{i18n>totalprice}'
                    @Measures.ISOCurrency   : CurrencyCode_code;
    totalLocal      @title                  : '{i18n>totallocal}'
                    @Measures.ISOCurrency   : LocalCurrencyCode_code;
}
