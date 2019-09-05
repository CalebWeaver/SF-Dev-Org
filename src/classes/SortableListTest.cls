@isTest
public with sharing class SortableListTest {

	@isTest
	public static void sort_givenFullListAndField_shouldSortByGivenField() {
		Account a = setupTestAccount('a', 'gggg');
		Account b = setupTestAccount('b', 'bbbb');
		Account c = setupTestAccount('c', 'mmmm');
		Account d = setupTestAccount('d', 'llll');

		List<Account> accs = new List<Account>{a,b,c,d};

		List<Account> sortedAccounts = (List<Account>) SortableList.sort(accs, 'Website');
		System.assertEquals(sortedAccounts[0], b, 'First index should be b');
		System.assertEquals(sortedAccounts[1], a, 'Second index should be a');
		System.assertEquals(sortedAccounts[2], d, 'Third index should be d');
		System.assertEquals(sortedAccounts[3], c, 'Fourth index should be c');
	}

	private static Account setupTestAccount(String name, String Website) {
		return new Account(
			Id = MockSObjectBuilder.getMockId(Account.getSObjectType()),
			Name = name,
			Website = website
		);
	}
}