public with sharing class meetUpHelper {
    @AuraEnabled(cacheable=true)
    public static List<Meetup__c> getMeetUps() {
        return [
            SELECT Id, Name, RegistrationCode__c, RegistrationLimit__c, TotalRegistered__c, Status__c
            FROM Meetup__c
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
}