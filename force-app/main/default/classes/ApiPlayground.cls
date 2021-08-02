public with sharing class ApiPlayground {
    @future(callout=true)
    public static void hospitalizedCurrently(){
        String endpoint = 'https://api.covidtracking.com/v1/us/current.json';
        HTTP http = new HTTP();
        HttpRequest req = new HttpRequest();
        // Set endpoint and method on the request body
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        // Send Request to get a response 
        HttpResponse res = http.send(req);
        
        // Deserialize Incoming JSON
        List<covidData> data = (List<covidData>)JSON.deserialize(res.getBody(), List<covidData>.class);
        integer currentlyHospitalized = data[0].hospitalizedCurrently;
        integer cumulativeHospitalized = data[0].hospitalizedCumulative;
        integer negative = data[0].negative;
        integer positive = data[0].positive;
        integer states = data[0].states;
        // Build Record	
        covidResult__c cr = new covidResult__c();
        cr.hospitalized_Currently__c = currentlyHospitalized;
        cr.hospitalized_Cumulative__c = cumulativeHospitalized;
        cr.negative__c = negative;
        cr.positive__c = positive;
        cr.states__c =  states;
        // Insert record
        insert cr;
            
        system.debug(cr);
    }
}