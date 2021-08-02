global class updateWeddingContactEmailInfo implements Database.Batchable<sObject>{
    // Start Method
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
        'SELECT Name, Email__c, Meal_Choice__c FROM Track_Wedding_Guest__c'
        );
    }	   
    global void execute(Database.BatchableContext bc, List<Track_Wedding_Guest__c> scope){
     	List<Track_Wedding_Guest__c> Updatedguests = new List<Track_Wedding_Guest__c>();
        for(Track_Wedding_Guest__c guest:scope){  
            	guest.Meal_Choice__c = null;
					
                Updatedguests.add(guest);
        }
        update Updatedguests;
    }
    global void finish(Database.BatchableContext bc){
        
    }

}