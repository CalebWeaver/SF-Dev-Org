public class SortableList {

	public static List<SObject> sort(List<SObject> items, String sortingField) {

		List<SortableSObject> sortables = new List<SortableSObject>();
		for (SObject item : items) {
			sortables.add(new SortableSObject(item, sortingField));
		}

		sortables.sort();

		List<SObject> returnItems = new List<SObject>();
		for (SortableSObject sortableObject : sortables) {
			returnItems.add(sortableObject.compareObject);
		}

		return returnItems;
	}

	public class SortableSObject implements Comparable {

		public SObject compareObject;
		public String compareField;

		public SortableSObject(SObject compareObject, String compareField) {
			this.compareObject = compareObject;
			this.compareField = compareField;
		}

		public Integer compareTo(Object compareTo) {
			SortableSObject compareToSortable = (SortableSObject) compareTo;

			Integer returnValue = 0;
			if (JSON.serialize(compareObject.get(compareField)) > JSON.serialize(compareToSortable.compareObject.get(compareField))) {
				returnValue = 1;
			} else {
				returnValue = -1;
			}

			return returnValue;
		}
	}
}