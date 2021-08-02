public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String lstName ){
        List<Contact> cons = new List<Contact>();
        for(integer i = 0; i < numContacts; i++){
            Contact c = new Contact(FirstName='Test ' + i, LastName= lstName);
            cons.add(c);
        }
        return cons;
    }
}