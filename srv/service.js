const cds = require("@sap/cds");
const wf = require("./wf");

module.exports = cds.service.impl(async function () {
  let { CarOrders } = this.entities;

  this.before("CREATE", "CarOrders", async (req) => {
    const { maxID } = await SELECT.one`max(CarOrderID) as maxID`.from(
      CarOrders
    );
    req.data.carOrderID = maxID + 1;
  });

  this.after("CREATE", "CarOrders", wf.approveCar);

  this.on("approveCar", "CarOrders", wf.approveCar);
});
