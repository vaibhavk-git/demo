import { LightningElement,api } from 'lwc';
export default class Accountitem extends LightningElement {

    @api account;
    selectHandler(event){
        // prevents the anchor element from navigating to URL 
        event.preventDefault();

        // creats the event with account id data 
        const selectedEvent = new customEvent('selected', { detail: this.account.id });

        //Dispatches the event
        this.dispatchEvent(selectedEvent);
    }

}