public with sharing class BetterList {

	List<SObject> sObjects = new List<SObject>();

	public List<SObject> sortAsc(String sortingField) {

		List<SortableSObjectAsc> sortables = new List<SortableSObjectAsc>();
		for (SObject item : sObjects) {
			sortables.add(new SortableSObjectAsc(item, sortingField));
		}

		sortables.sort();

		List<SObject> returnList = new List<SObject>();
		for (SortableSObjectAsc sortableObject : sortables) {
			returnList.add(sortableObject.compareObject);
		}

		return returnList;
	}

	public List<SObject> sortDesc(String sortingField) {

		List<SortableSObjectDesc> sortables = new List<SortableSObjectDesc>();
		for (SObject item : sObjects) {
			sortables.add(new SortableSObjectDesc(item, sortingField));
		}

		sortables.sort();

		List<SObject> returnList = new List<SObject>();
		for (SortableSObjectDesc sortableObject : sortables) {
			returnList.add(sortableObject.compareObject);
		}

		return returnList;
	}

	public List<SObject> filterEqualTo(String filterField, String fieldValue) {

		List<SObject> returnList = new List<SObject>();
		System.debug(sObjects);
		for (SObject item : sObjects) {
			if (JSON.serialize(item.get(filterField)) == fieldValue) {
				returnList.add(item);
			}
		}

		return returnList;
	}

	public void add(SObject listElement) {
		sObjects.add(listElement);
	}

	public SObject get(Integer index) {
		return sObjects.get(index);
	}

	public override String toString() {
		return sObjects + '';
	}

	public class SortableSObjectAsc implements Comparable {

		public SObject compareObject;
		public String compareField;

		public SortableSObjectAsc(SObject compareObject, String compareField) {
			this.compareObject = compareObject;
			this.compareField = compareField;
		}

		public Integer compareTo(Object compareTo) {
			SortableSObjectAsc compareToSortable = (SortableSObjectAsc) compareTo;

			Integer returnValue = 0;
			if (JSON.serialize(compareObject.get(compareField)) > JSON.serialize(compareToSortable.compareObject.get(compareField))) {
				returnValue = 1;
			} else {
				returnValue = -1;
			}

			return returnValue;
		}
	}

	public class SortableSObjectDesc implements Comparable {

		public SObject compareObject;
		public String compareField;

		public SortableSObjectDesc(SObject compareObject, String compareField) {
			this.compareObject = compareObject;
			this.compareField = compareField;
		}

		public Integer compareTo(Object compareTo) {
			SortableSObjectDesc compareToSortable = (SortableSObjectDesc) compareTo;

			Integer returnValue = 0;
			if (JSON.serialize(compareObject.get(compareField)) > JSON.serialize(compareToSortable.compareObject.get(compareField))) {
				returnValue = -1;
			} else {
				returnValue = 1;
			}

			return returnValue;
		}
	}
}