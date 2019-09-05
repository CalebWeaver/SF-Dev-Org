import {LightningElement, wire, track, api} from 'lwc';
import getSObjectsByRecordType from '@salesforce/apex/RecordTypeRelatedListController.getSObjectsByRecordType';

let columns = [];

export default class RecordTypeRelatedList extends LightningElement {

	@api recordId;
	@api title;
	@api object = 'Account';
	@api icon;
	@api iconTitle;
	@api childField = '';
	@api recordType = '';
	@api column1Label = '';
	@api column1Field = '';
	@api column1Type = '';
	@api column2Label = '';
	@api column2Field = '';
	@api column2Type = '';
	@api column3Label = '';
	@api column3Field = '';
	@api column3Type = '';
	@api column4Label = '';
	@api column4Field = '';
	@api column4Type = '';
	@track sortedBy = 'Name';
	@track sortedDirection = 'asc';

	@track columns = columns;
	@track objects;
	@wire(getSObjectsByRecordType, {
		parentId: '$recordId',
		sObjectName: '$object',
		childField: '$childField',
		recordType: '$recordType',
		column1Field: '$column1Field',
		column2Field: '$column2Field',
		column3Field: '$column3Field',
		column4Field: '$column4Field',
	})
	wiredAccounts({error, data}) {
		if (data) {
			let objects = JSON.parse(JSON.stringify(data));
			objects.map(obj => obj.nameLink = '/' + obj.Id);
			objects.map(obj => obj.idLink = '/' + obj.Id);
			this.objects = objects;
		}
	}

	connectedCallback() {
		this.columns.push(this.createColumn(this.column1Label, this.column1Field, this.column1Type));
		if (this.column2Field) this.columns.push(this.createColumn(this.column2Label, this.column2Field, this.column2Type));
		if (this.column3Field) this.columns.push(this.createColumn(this.column3Label, this.column3Field, this.column3Type));
		if (this.column4Field) this.columns.push(this.createColumn(this.column4Label, this.column4Field, this.column4Type));
	}

	createColumn(label, field, type) {
		let column = {};
		column.label = label;
		column.fieldName = field;
		column.sortable = true;
		if (type === 'date') {
			column.type = 'date-local';
			column.typeAttributes = {
				month: "2-digit",
				day: "2-digit"
			};
		} else if (field === 'Name') {
			column.type = 'url';
			column.fieldName = 'nameLink';
			column.typeAttributes = { label: {fieldName: 'Name'}, target:"_blank" };
		} else if (field === 'Id') {
			column.type = 'url';
			column.fieldName = 'idLink';
			column.typeAttributes = { label: {fieldName: 'Id'}, target:"_blank" };
		}

		return column;
	}

	handleSort(event) {
		let fieldName = event.detail.fieldName;
		let sortDirection = event.detail.sortDirection;

		this.sortedBy = fieldName;
		this.sortedDirection = sortDirection;
		this.sortData(fieldName, sortDirection);
	}

	sortData(fieldName, sortDirection) {
		let reverse = sortDirection === 'asc' ? 1: -1;
		let obj = this.objects.slice();

		if (fieldName === 'idLink') {
			fieldName = 'Id';
		} else if (fieldName === 'nameLink') {
			fieldName = 'Name';
		}

		obj.sort((a,b) => {

			a = a[fieldName];
			b = b[fieldName];
			let sortValue;

			if (a instanceof Date) {
				sortValue = this.sortNumeric(a, b);
			} else if (!isNaN(a)) {
				sortValue = this.sortNumeric(a,b);
			} else {
				sortValue = this.sortAlphabetical(a,b);
			}

			return sortValue * reverse;
		});
		this.objects = obj;
	}

	sortNumeric(a,b) {
		return b - a;
	}

	sortAlphabetical(a,b) {
		if (a < b){
			return -1;
		} else if (a > b){
			return 1;
		} else {
			return 0;
		}
	}
}