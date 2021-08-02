trigger Meetup on Meetup__c (before insert, after insert, after delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            for(Meetup__c meetUp : Trigger.new){
                Integer length = 8;
                Blob blobKey = crypto.generateAesKey(128);
                String key = EncodingUtil.convertToHex(blobKey);
                String regCode = key.substring(0,length);
                
                meetUp.RegistrationCode__c = regCode;
            }
        } else if (Trigger.isAfter) {
            // Process after insert
        }        
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}