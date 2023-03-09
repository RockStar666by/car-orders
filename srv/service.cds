using epam.sap.dev.ordercar as car from '../db/schema';
using sap.common as common from '@sap/cds/common';

service OrderCarService {
    entity CarOrders as projection on car.CarOrders actions {
        action approveCar();
    };
    entity Statuses   as projection on car.Statuses;
}

service TechnicalService @(requires : 'system-user') {
    entity CarOrders as projection on car.CarOrders;
    entity Statuses   as projection on car.Statuses;
    entity Currencies as projection on common.Currencies;
}
