public class AccountProcessor {
    @future
    public static void countContacts(List<ID> AcctIds)
    {  
         // For each Account ID passed to the method, 
         List<Account> accts = [SELECT Id, Number_of_Contacts__c,
                                (Select id from contacts)
                                FROM Account 
                                WHERE Id IN :AcctIds];
        	
        for(Account acc : accts){
            List<Contact> lstCont = acc.contacts;
            // count the number of Contact records associated to it
            acc.Number_of_Contacts__c = lstCont.size();
        }
         // update the 'Number_of_Contacts__c' field with this value.
         update accts;
    }

}