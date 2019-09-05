public with sharing class Arena_Complete {
	public String ArenaType {get;set;}
	public Integer CrowdSize {get;set;}
	public Integer ArenaOccupancy {get;set;}
	public List<String> Concessions {get;set;}

	public Arena_Complete() {
		Concessions = new List<String>();
	}
}