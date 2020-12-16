import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class CreateAcntForm extends LightningElement {
    accountobject = ACCOUNT_OBJECT;
}