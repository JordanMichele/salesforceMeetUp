trigger TrackWeddingGuestTrigger on Track_Wedding_Guest__c (before insert) {
    List<Track_Wedding_Guest__c> guestList = new List<Track_Wedding_Guest__c>();
// Loop through the newly created Wedding guest 
    for(Track_Wedding_Guest__c guest : Trigger.New){
        // if no value for response then make undecided
        if(String.isEmpty(guest.Response__c)){
            guest.Response__c =  'Unsure';
        }
    }
}