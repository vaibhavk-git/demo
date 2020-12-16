import { LightningElement } from 'lwc';

export default class Welcome extends LightningElement {
    greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}