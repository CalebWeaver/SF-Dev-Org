public without sharing class RecordTypeRelatedListController {

	@AuraEnabled(Cacheable=true)
	public static List<SObject> getSObjectsByRecordType(String parentId, String sObjectName, String childField, String recordType, String column1Field,
		String column2Field, String column3Field, String column4Field) {

		System.debug('SObjectName: '+sObjectName);
		System.debug('parentId: '+parentId);
		System.debug('childField: '+childField);
		List<String> fields = new List<String>{column1Field,column2Field,column3Field,column4Field};

		RecordTypeRelatedListValidator validator = new RecordTypeRelatedListValidator();
		validator.SObjectName = sObjectName;
		validator.RecordType = recordType;
		validator.Fields = fields;
		validator.Fields.add(childField);

		if (validator.validate()) {
			String queryFields = '';
			for (String field : fields) {
				if (String.isNotBlank(field)) {
					queryFields += field + ',';
				}
			}
			queryFields = queryFields.substring(0, queryFields.length()-1);
			System.debug('SELECT ' + queryFields + ' FROM '+sObjectName+' WHERE RecordType.DeveloperName = \''+recordType+'\' AND '+childField+' = \''+parentId+'\'');
			return Database.query('SELECT ' + queryFields + ' FROM '+sObjectName+' WHERE RecordType.DeveloperName = \''+recordType+'\' AND '+childField+' = \''+parentId+'\'');
		} else {
			throw new AuraHandledException('One of the fields is configured incorrectly!');
		}
	}
}