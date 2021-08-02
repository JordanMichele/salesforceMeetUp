public with sharing class ContactController {
  public static List<Contact> getAllContacts() {
    return [SELECT Id,Name FROM Contact limit 10];
  }
}