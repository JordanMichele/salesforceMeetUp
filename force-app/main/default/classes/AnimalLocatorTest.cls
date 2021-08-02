@isTest
public with sharing class AnimalLocatorTest {
        @isTest static void testGetCallout() {
            Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
            String result = AnimalLocator.getAnimalNameById(2);
            String expectedValue = 'bear';
            System.assertEquals(result, expectedValue);
    }  
}