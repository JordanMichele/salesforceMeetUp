@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the accId from the end of the URL
        String accId = request.requestURI.substringBetween('Accounts/','/contacts');

        Account result =  [SELECT Id, Name, (SELECT Id, name FROM Contacts)
                        FROM Account
                        WHERE Id = :accId];
        return result;
    }
}