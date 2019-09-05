public with sharing class CharacterComparisonUtility {

	public String ArenaType {get;set;}
	public Integer CrowdSize {get;set;}
	public Integer ArenaOccupancy {get;set;}
	public String Concessions {get;set;}

	public CharacterComparisonUtility(String arenaType, String arenaSize) {
		if (arenaType == 'Ooze') {
			Concessions = 'Pudding';
		} else if (arenaType == 'Mana') {
			Concessions = 'Popsicles';
		}
		this.ArenaType = arenaType;

		if (arenaSize == 'Small') {
			this.ArenaOccupancy = 2;
			this.CrowdSize = 100;
		} else if (arenaSize == 'Large') {
			this.ArenaOccupancy = 4;
			this.CrowdSize = 1000;
		}
	}

	public void compareCharacter(String name1, Integer strength1, Integer stamina1, Integer science1, Integer spells1,
		String name2, Integer strength2, Integer stamina2, Integer science2, Integer spells2, Integer rounds) {

		Integer score1 = 0;
		Integer score2 = 0;

		if (ArenaType == 'Ooze'
			&& science1 > science2) {
			science1 += 2;
		} else if (ArenaType == 'Ooze'
			&& science2 > science1) {
			science2 += 2;
		}

		if (ArenaType == 'Mana'
			&& spells1 > spells2) {
			spells1 += 2;
		} else if (ArenaType == 'Mana'
			&& spells2 > spells1) {
			spells2 += 2;
		}

		String accessory1;
		String accessory2;
		if (science1 > 0) {
			name1 += ' the Scientist';
			accessory1 = 'Ray Gun';
		} else if (spells1 > 0) {
			name1 += ' the Wizard';
			accessory1 = 'Wand';
		}

		if (science2 > 0) {
			name2 += ' the Scientist';
			accessory2 = 'Ray Gun';
		} else if (spells2 > 0) {
			name2 += ' the Wizard';
			accessory2 = 'Wand';
		}

		for (Integer round = 0; round < rounds; round++) {
			if (strength1 > strength2) {
				score1 += round + strength1;
			} else if (strength2 > strength1) {
				score2 += round + strength2;
			}

			if (stamina1 > stamina2) {
				score1 += round + stamina1;
			} else if (stamina2 > stamina1) {
				score2 += round + stamina2;
			}

			if (spells1 > spells2) {
				score1 += round * spells1;
			} else if (spells2 > spells1) {
				score2 += round * spells2;
			}

			if (science1 > science2) {
				score1 += round * science1;
			} else if (science2 > science1) {
				score2 += round * science2;
			}
		}

		if (score1 > score2) {
			System.debug(name1 + ' is the best character, with the ' + accessory1 + ' in the ' + ArenaType + 'arena!');
		} else if (score2 > score1) {
			System.debug(name2 + ' is the best character, with the ' + accessory2 + ' in the ' + ArenaType + 'arena!');
		} else {
			System.debug('The clash is a draw');
		}
	}
}