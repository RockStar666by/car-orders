sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ordercarui/test/integration/FirstJourney',
		'ordercarui/test/integration/pages/CarOrdersList',
		'ordercarui/test/integration/pages/CarOrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CarOrdersList, CarOrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ordercarui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCarOrdersList: CarOrdersList,
					onTheCarOrdersObjectPage: CarOrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);