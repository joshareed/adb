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
	Profile profile = new Profile()

	static constraints = {
		username	blank: false, unique: true
		password	blank: false
		firstName	blank: false
		lastName	blank: false
		email		blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}
}
