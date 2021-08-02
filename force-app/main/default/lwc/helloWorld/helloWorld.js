// import { LightningElement, track } from "lwc";
// export default class HelloWorld extends LightningElement {
//   @track greeting = "World";
//   changeHandler(event) {
//     this.greeting = event.target.value;
//   }
// }

import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";

import getTheGroupId from "@salesforce/apex/weddingController.getGroupId";
import GROUP_NAME_FIELD from "@salesforce/schema/Guest_Group__c.Name";
import NAME_FIELD from "@salesforce/schema/Track_Wedding_Guest__c.Name";

const fields = [NAME_FIELD, GROUP_NAME_FIELD];

export default class HelloWorld extends LightningElement {
  @api recordId;
  @api objectApiName;
  @api wiredGuests;
  @api realFormData;

  @wire(getTheGroupId, { groupId: "$recordId" })
  guests;

  @wire(getRecord, { recordId: "$recordId", fields })
  helloWorld;

  get groupName() {
    return getFieldValue(this.helloWorld.data, GROUP_NAME_FIELD);
  }

  get Name() {
    return getFieldValue(this.helloWorld.data, NAME_FIELD);
  }
}