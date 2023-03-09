const cds = require("@sap/cds");
const constants = require("./constants");

module.exports = {
  approveCar: approveCar,
};

const { CarOrders } = cds.entities("epam.sap.dev.ordercar");

async function approveCar(req) {
  console.log("REQUEST", req);
  try {
    const { orderUUID } = req;
    let query = cds.read(CarOrders).where({ orderUUID: orderUUID });
    let instance = await cds.run(query);
    let status_ID = instance[0].status_ID;
    if (status_ID == "1" || status_ID == "4") {
      let rent = parseFloat(instance[0].rent);
      let totalPrice = parseFloat(instance[0].totalPrice);
      let totalLocal = parseFloat(instance[0].totalLocal);
      const payload = {
        definitionId: "approvecarorder",
        context: {
          WorkflowDetails: {
            title: "Car(s) in order",
            comment: "Please Approve",
          },
          CarOrder: {
            orderUUID: orderUUID,
            carOrderID: instance[0].carOrderID,
            userID: instance[0].userID,
            make: instance[0].make,
            model: instance[0].model,
            officeCity: instance[0].officeCity,
            officeStreet: instance[0].officeStreet,
            CurrencyCode_code: instance[0].CurrencyCode_code,
            LocalCurrencyCode_code: instance[0].LocalCurrencyCode_code,
            rent: rent,
            quantity: instance[0].quantity,
            status_ID: status_ID,
            totalPrice: totalPrice,
            totalLocal: totalLocal,
          },
        },
      };
      const workflow = await cds.connect.to("workflowService");
      await workflow.tx(req).post("/rest/v1/workflow-instances", payload);
      return UPDATE(CarOrders, orderUUID).with({ status_ID: "5" });
    } else if (status_ID == "5") {
      req.error(400, constants.genericErrors.processingOrder);
    } else req.error(400, constants.genericErrors.orderApproved);
  } catch (error) {
    console.log("Error of the WF instance creation: ", error);
  }
}
