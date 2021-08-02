import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";

import NAME_FIELD from "@salesforce/schema/Track_Wedding_Guest__c.Name";
import AMOUNT_GIFTED_FIELD from "@salesforce/schema/Track_Wedding_Guest__c.Amount_gifted__c";
import MEAL_CHOICE from "@salesforce/schema/Track_Wedding_Guest__c.Meal_Choice__c";
import RESPONDED from "@salesforce/schema/Track_Wedding_Guest__c.Responded__c";
import GUESTGROUP from "@salesforce/schema/Track_Wedding_Guest__c.Guest_Group__r.Name";

// Plus One
import PLUS_ONE from "@salesforce/schema/Track_Wedding_Guest__c.Plus_One__c";

const fields = [
  NAME_FIELD,
  AMOUNT_GIFTED_FIELD,
  MEAL_CHOICE,
  RESPONDED,
  GUESTGROUP,
  PLUS_ONE
];

export default class WeddingRecordDetail extends LightningElement {
  @api recordId;
  @api objectApiName;

  @wire(getRecord, { recordId: "$recordId", fields })
  weddingRecordDetail;
  showForm = false;

  get name() {
    return getFieldValue(this.weddingRecordDetail.data, NAME_FIELD);
  }

  get amountGifted() {
    return getFieldValue(this.weddingRecordDetail.data, AMOUNT_GIFTED_FIELD);
  }

  get mealChoice() {
    return getFieldValue(this.weddingRecordDetail.data, MEAL_CHOICE);
  }

  get responded() {
    return getFieldValue(this.weddingRecordDetail.data, RESPONDED);
  }

  get guestGroup() {
    return getFieldValue(this.weddingRecordDetail.data, GUESTGROUP);
  }

  get pluseOne() {
    return getFieldValue(this.weddingRecordDetail.data, PLUS_ONE);
  }

  handleSubmit(event){
    event.preventDefault();       // stop the form from submitting
    const fields = event.detail.fields;
    this.template.querySelector('lightning-record-edit-form').submit(fields);
 }

 toggleFields() {
  this.showForm = !this.showForm;
}
}