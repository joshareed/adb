package org.andrill.adb

class Project {

	String name
	String description = ""
	String url = ""

    static constraints = {
		name 			blank: false
		description		blank: true
		url				blank: true
    }
}
