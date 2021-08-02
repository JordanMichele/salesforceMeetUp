import { LightningElement, wire, track, api} from "lwc";
import { NavigationMixin } from 'lightning/navigation';
import MeetUpRegistration from '@salesforce/schema/MeetupRegistration__c';
import FIRST_NAME from '@salesforce/schema/MeetupRegistration__c.FirstName__c';
import LAST_NAME from '@salesforce/schema/MeetupRegistration__c.LastName__c';
import EMAIL from '@salesforce/schema/MeetupRegistration__c.Email__c';
import MEETUP from '@salesforce/schema/MeetupRegistration__c.Meetup__c';
import getMeetUps from '@salesforce/apex/meetUpHelper.getMeetUps';


export default class MeetUpReg extends NavigationMixin(LightningElement)  {
    @api recordId;
    @wire(getMeetUps)
    meetUps;

 navigateToRecordPage(event) {
    const selectedRecordId = event.target.name;
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId: selectedRecordId,
            objectApiName: 'Meetup__c',
            actionName: 'view'
        }
    });
}

    MeetupRegistrationObject = MeetUpRegistration;
    myFields = [FIRST_NAME, LAST_NAME, EMAIL, MEETUP];

}