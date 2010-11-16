package org.andrill.adb

class Profile {
	static belongsTo = User
	
	User user
	String department = ""
	String institution = ""
	String address1 = ""
	String address2 = ""
	String city = ""
	String state = ""
	String postalCode = ""
	String country = ""

	static constraints = {
		department  blank: true
		institution blank: true
		address1    blank: true
		address2    blank: true
		city        blank: true
		state       blank: true
		postalCode  blank: true
		country     blank: true
	}
}
