public with sharing class MockJSONREST {
    public static String getUserAddressById(Integer Id){
        // build the request
        Integer paramId     = Id;
        Http http           = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/users/' + paramId);
        request.setMethod('GET');
        // send the request
        HttpResponse response = http.send(request);
        // verify the response
        String strResponse = '';
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             System.debug('Received the following results: ' + results);
            Map<String, Object> address = (Map<String, Object>) results.get('address');
            System.debug('Get ADDRESS MAP: ' + address);
            Map<String, Object> geo = (Map<String, Object>) address.get('geo');
            System.debug('Get GEO MAP: ' + geo);

            strResponse = string.valueOf(geo.get('lat'));
            System.debug('Get LAT: ' + strResponse);
        }
        return strResponse;
    }
}