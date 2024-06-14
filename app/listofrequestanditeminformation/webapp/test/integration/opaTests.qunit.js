sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'listofrequestanditeminformation/test/integration/FirstJourney',
		'listofrequestanditeminformation/test/integration/pages/RequestsList',
		'listofrequestanditeminformation/test/integration/pages/RequestsObjectPage'
    ],
    function(JourneyRunner, opaJourney, RequestsList, RequestsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('listofrequestanditeminformation') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRequestsList: RequestsList,
					onTheRequestsObjectPage: RequestsObjectPage
                }
            },
            opaJourney.run
        );
    }
);