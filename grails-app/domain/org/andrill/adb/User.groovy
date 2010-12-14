package org.andrill.adb

class User {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	// custom fields
	String firstName
	String lastName
	String email

	// contact info
	String department = ""
	String institution = ""
	String address1 = ""
	String address2 = ""
	String city = ""
	String state = ""
	String postalCode = ""
	String country = ""

	static constraints = {
		username	blank: false, unique: true
		password	blank: false
		firstName	blank: false
		lastName	blank: false
		email		blank: false
		department	blank: true
		institution blank: true
		address1	blank: true
		address2	blank: true
		city		blank: true
		state		blank: true
		postalCode	blank: true
		country		blank: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}
}
