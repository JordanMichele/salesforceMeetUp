@isTest
private class AccountManagerTest {
    @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://jordanmichele-dev-ed.lightning.force.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAcc = AccountManager.getAccount();
        List<Contact> accountContacts = [SELECT Id, name FROM Contact WHERE AccountId = :recordId];
        // Verify results
        System.assert(thisAcc != null);
        System.assertEquals('Test record', thisAcc.Name);
        System.assertEquals(2, accountContacts.size());
    }

    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(
                                Name='Test record'
                                    );
        insert accTest;
        Contact conTest = new Contact(
                                AccountId = accTest.Id,
                                FirstName='Test Contact',
                                LastName='Test Contact Last Name'        
                                    );
        insert conTest;

         Contact conTest2 = new Contact(
                                AccountId = accTest.Id,
                                FirstName='Test Contact2',
                                LastName='Test Contact2 Last Name'     
                                    );
        insert conTest2;
        

        return accTest.Id;
    }  
}