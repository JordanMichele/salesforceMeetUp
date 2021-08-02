import { LightningElement } from "lwc";
import MeetUpRegistration from '@salesforce/schema/MeetupRegistration__c';
import FIRST_NAME from '@salesforce/schema/MeetupRegistration__c.FirstName__c';
import LAST_NAME from '@salesforce/schema/MeetupRegistration__c.LastName__c';
import EMAIL from '@salesforce/schema/MeetupRegistration__c.Email__c';
import MEETUP from '@salesforce/schema/MeetupRegistration__c.Meetup__c';


export default class MeetUpRecordView extends LightningElement {
    MeetupRegistrationObject = MeetUpRegistration;
    myFields = [FIRST_NAME, LAST_NAME, EMAIL, MEETUP];
}