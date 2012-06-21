package s2dsa

class Player {
	static hasMany = [unlockedBy: UnlockedPlayer]
	
	String name
	String about
	String department
	String secret
	String s2name
	
    static constraints = {
		name(blank:false)
		department(blank:false)
		secret(blank:false)
		s2name(unique: true, blank:false)
    }
}
