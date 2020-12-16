import { LightningElement, wire } from "lwc";

import { getRecord } from "lightning/uiRecordApi";
import Id from "@salesforce/user/Id";

export default class Selector extends LightningElement {
  name;
  @wire(getRecord, {
    recordId: Id,
    fields: ["User.Name"]
  })
  userData({ error, data }) {
      let objCurrentData = data.fields;
      this.name = objCurrentData.Name.value
  }
}