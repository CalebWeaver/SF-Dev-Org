public with sharing class Arena {
	public String ArenaType {get;set;}
	public Integer CrowdSize {get;set;}
	public Integer ArenaOccupancy {get;set;}
	public List<String> Concessions {get;set;}

	public Arena() {
		Concessions = new List<String>();
	}
}