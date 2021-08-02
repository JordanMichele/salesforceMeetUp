trigger MeetUpRegTrigger on MeetupRegistration__c (before insert, after insert, after delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            for(MeetupRegistration__c meetUpReg : Trigger.new){
                String email = meetUpReg.Email__c;
				email += '%';
                String meetUp = meetUpReg.Meetup__c;
               
                list<MeetupRegistration__c> emailDupCheck = [SELECT Email__c 
                                                             FROM MeetupRegistration__c 
                                                             WHERE Email__c LIKE :email and MeetUp__c = :meetUp];
                list<MeetupRegistration__c> statusCheck = [SELECT Meetup__r.Status__c,Meetup__r.TotalRegistered__c, 
                                                           Meetup__r.RegistrationLimit__c 
                                                           FROM MeetupRegistration__c
                                                           WHERE MeetUp__c = :meetUp
                                                          ];
                if(statusCheck.size() > 0){
                    String statusMeetUp = statusCheck[0].Meetup__r.Status__c;
                    Decimal TotalRegistered = statusCheck[0].Meetup__r.TotalRegistered__c;
                    Decimal RegistrationLimit = statusCheck[0].Meetup__r.RegistrationLimit__c;
                    if(TotalRegistered >= RegistrationLimit){
                        meetUpReg.addError('Registration LIMIT for this MeetUp has been reached!');
                    }
                    if(statusMeetUp == 'Closed'){
                        meetUpReg.addError('That MeetUp is CLOSED, Select another MeetUp!');
                    }
                    if(emailDupCheck.size() > 0){
                        meetUpReg.addError('That Email is aleady being used for this MeetUp');
                    }                  
                }
  
                
            }
        } else if (Trigger.isAfter) {
            // Process after insert
        }        
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}