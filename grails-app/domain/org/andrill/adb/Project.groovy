package org.andrill.adb

class Project {

	String name
	String description
	String url

    static constraints = {
		code blank: false, unique: true
		name blank: false
    }
}
