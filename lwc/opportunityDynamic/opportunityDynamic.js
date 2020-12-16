import { LightningElement, api, wire } from 'lwc';
import opportunityAmount from '@salesforce/label/c.opportunityAmount';
import opportunityName from '@salesforce/label/c.opportunityName';

import gettOppo from '@salesforce/apex/myOpportunity.gettOppo';
export default class OpportunityDynamic extends LightningElement {
    @api recordId;
    @api amount;
    handleChange(event){
        this.amount = event.target.value;
    }
    @wire(gettOppo, {acId:'$recordId', amt:'$amount'})
    Opportunities;
    label= {
        opportunityAmount,
        opportunityName
    };
}