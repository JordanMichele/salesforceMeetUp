public class openWeather {
    public String city{get; set;}
    public String temp{get; set;}
    public String pressure{get; set;}
    public String humidity{get; set;}
    public String temp_min{get; set;}
    public String temp_max{get; set;}
    
    public openWeather(ApexPages.StandardController stdController){
        	Account account = (Account)stdController.getRecord();
        	account = [SELECT Id, ShippingCity, BillingPostalCode FROM Account WHERE Id = :account.id];
        
        	String accountCity = account.ShippingCity;
        	String accountZip = account.BillingPostalCode;
        	String apiKey = '0ef99b497547688a2ef307fb58ccfbb6';
        	
        	String requestEndPoint = 'http://api.openweathermap.org/data/2.5/weather';
        	requestEndPoint += '?zip='+ accountZip;
            requestEndPoint += '&units=imperial';
            requestEndPoint += '&appid='+ apiKey;
        
        	Http http = new Http();
        	HttpRequest request = new HttpRequest();
        	request.setEndpoint(requestEndPoint);
        	request.setMethod('GET');
        	
        	HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            system.debug('JORDAN ' + result);
            city = String.valueOf(result.get('name'));
            Map<String, Object> mainResults = (Map<String, Object>)(result.get('main'));
            temp = String.valueOf(mainResults.get('temp'));
            pressure = String.valueOf(mainResults.get('pressure'));
            humidity = String.valueOf(mainResults.get('humidity'));
            temp_min = String.valueOf(mainResults.get('temp_min'));
            temp_max = String.valueOf(mainResults.get('temp_max'));
        } else {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'There was an Error requesting the Data');
            ApexPages.addMessage(myMsg);
        }
        
    }
}