using OrderCarService from '../../srv/service';

annotate OrderCarService.CarOrders with @odata.draft.enabled;

annotate OrderCarService.CarOrders with @Capabilities : {
    Deletable  : true,
    Insertable : true
};
