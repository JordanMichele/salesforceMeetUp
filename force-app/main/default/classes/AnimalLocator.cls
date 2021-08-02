public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer Id){
        // build the request
        Integer paramId     = Id;
        Http http           = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + paramId);
        request.setEndpoint('https://jsonplaceholder.typicode.com/posts/' + paramId);
        request.setMethod('GET');
        // send the request
        HttpResponse response = http.send(request);
        // verify the response
        String strResponse = '';
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             System.debug('Received the following results: ' + results);
            //Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            //System.debug('Get animal MAP: ' + animals);


            strResponse = string.valueOf(results.get('title'));
            System.debug('Get title: ' + strResponse);

           // strResponse = string.valueOf(animals.get('name'));
           // System.debug('FINAL Response ' + strResponse);
        }
        return strResponse;
    }
}