public with sharing class RecordTypeRelatedListValidator {

	public String SObjectName {get;set;}
	public String RecordType {get;set;}
	public List<String> Fields {get;set;}

	public Boolean validate() {
		Boolean isValid = isSObjectNameValid();

		if (isValid) {
			if (!isRecordTypeValid()) {
				isValid = false;
			}

			for (String field : Fields) {
				if (!isFieldValid(field)) {
					isValid = false;
				}
			}
		}

		return isValid;
	}

	private Boolean isSObjectNameValid() {
		return Schema.getGlobalDescribe().containsKey(SObjectName);
	}

	private Boolean isRecordTypeValid() {
		return Schema.getGlobalDescribe().get(SObjectName).getDescribe().getRecordTypeInfosByDeveloperName().containsKey(RecordType);
	}

	private Boolean isFieldValid(String field) {
		return Schema.getGlobalDescribe().get(SObjectName).getDescribe().fields.getMap().containsKey(field) || String.isBlank(field);
	}
}