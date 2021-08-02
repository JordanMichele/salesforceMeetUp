@isTest
private class TestRestrictContactByName {
	    @isTest static void TestRestrictContactGood() {	
        Contact con = new Contact(LastName='Doe');
            insert con;
            System.assertEquals('Doe', con.LastName);
    }
    @isTest static void TestRestrictContactBad(){
        Contact con2 = new Contact(LastName='INVALIDNAME');
        insert con2;
        	System.assertEquals('INVALIDNAME', con2.LastName);
    }
}