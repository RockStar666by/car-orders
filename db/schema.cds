namespace epam.sap.dev.ordercar;

using {managed} from '@sap/cds/common';
using {
    sap.common.CodeList,
    Currency
} from './common';

entity CarOrders : managed {
    key orderUUID         : UUID;
        carUUID           : UUID;
        carOrderID        : Integer;
        userID            : String(40);
        make              : String(40);
        model             : String(40);
        officeUUID        : UUID;
        officeCity        : String(40);
        officeStreet      : String(40);
        CurrencyCode      : Currency;
        LocalCurrencyCode : Currency;
        rent              : Decimal(15, 2);
        quantity          : Integer;
        status            : Association to One Statuses;
        totalPrice        : Decimal(15, 2);
        totalLocal        : Decimal(15, 2);
}

entity Statuses {
    key ID          : String;
        name        : String(20);
        criticality : Integer;
}
