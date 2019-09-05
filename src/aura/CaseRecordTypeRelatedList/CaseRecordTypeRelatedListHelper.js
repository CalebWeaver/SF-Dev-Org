({
	setFilter: function(component) {
		console.log('RecordType.DeveloperName = \''+component.get('v.recordType')+'\'');
		component.set('v.filter', 'RecordType.DeveloperName = \''+component.get('v.recordType')+'\'');
	}
})