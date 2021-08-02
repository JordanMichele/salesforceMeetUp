public with sharing class weddingController {
  public Track_Wedding_Guest__c guestTracking { get; set; }

    @AuraEnabled(cacheable=true)
    public static list<Track_Wedding_Guest__c> getGroupId(id groupId){
        id queryId = groupId;
        List<Track_Wedding_Guest__c> guestsByGroup = [SELECT name, Guest_Group__r.name, 
                                                      Guest_Group__r.id
                                                      FROM Track_Wedding_Guest__c 
                                                      WHERE Guest_Group__r.id = :groupId];
        for(Track_Wedding_Guest__c guest : guestsByGroup){
            system.debug(guest.name);
        }
        system.debug(guestsByGroup);
        return guestsByGroup;
        
    }
}