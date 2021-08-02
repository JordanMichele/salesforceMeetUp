@isTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact cont = new Contact();
        cont.FirstName = 'Jordan';
        cont.LastName = 'Michael';
        cont.AccountId = a.Id;
        Insert cont;
        
        List<Id> AcctIds = new List<ID>();
        AcctIds.add(a.Id);
        
     	Test.startTest();
        	AccountProcessor.countContacts(AcctIds);
        Test.stopTest();
        
        Account ACC = [SELECT Number_of_Contacts__c 
                       FROM Account 
                       WHERE id = :a.id 
                       Limit 1];
        System.assertEquals(Integer.valueOf(ACC.Number_of_Contacts__c) ,1);
    }
}